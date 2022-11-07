# == Schema Information
#
# Table name: images
#
#  id           :uuid             not null, primary key
#  blames_count :integer          default(0)
#  likes_count  :integer          default(0)
#  prompt       :text
#  seed         :string
#  user         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  space_id     :uuid             not null
#  user_id      :uuid
#
# Indexes
#
#  index_images_on_space_id  (space_id)
#  index_images_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (space_id => spaces.id)
#  fk_rails_...  (user_id => users.id)
#
class Image < ApplicationRecord

  BAN_AFTER_BLAMES = 2

  belongs_to :space
  belongs_to :user, optional: true
  has_many :likes
  has_many :blames
  has_and_belongs_to_many :answers

  has_one_attached :generated
  has_one_attached :shareable

  after_create :prepare

  scope :ordered, -> { order(likes_count: :desc, created_at: :desc)}
  scope :ordered_by_date, -> { order(created_at: :desc)}
  scope :not_blamed, -> { where('images.blames_count < ?', BAN_AFTER_BLAMES)}
  scope :filtered, -> { not_blamed.ordered }

  def liked_by?(user)
    likes.where(user: user).exists?
  end

  def blamed_by?(user)
    blames.where(user: user).exists?
  end

  def banned?
    blames_count >= BAN_AFTER_BLAMES
  end

  def prompt_raw
    answers.collect(&:value).join(', ')
  end

  def ready?
    persisted? && 
    generated.attached? && 
    generated.analyzed? && 
    shareable.attached? &&
    shareable.analyzed?
  end
 
  def to_s
    string = prompt_raw
    string += " par #{ user.pseudo }" if self&.user&.pseudo&.present?
    string
  end

  # protected

  def prepare
    prepare_generated unless generated.attached?
    prepare_shareable unless shareable.attached?
  end
  handle_asynchronously :prepare

  def prepare_generated
    artifact = Stability.generate prompt
    self.update_column :seed, artifact.seed 
    io = StringIO.new artifact.binary
    generated.attach  io: io,
                      filename: 'generated.png',
                      content_type: 'image/png'
  end

  def prepare_shareable
    image = ChunkyPNG::Image.from_blob generated.download
    image.resample_nearest_neighbor! 1024, 1024
    if space.share_overlay.attached?
      overlay  = ChunkyPNG::Image.from_blob space.share_overlay.download
      image.compose! overlay
    end
    io = StringIO.new
    io.puts image.to_datastream.to_blob
    io.rewind
    shareable.attach  io: io,
                      filename: 'shareable.png',
                      content_type: 'image/png'
  end
end
