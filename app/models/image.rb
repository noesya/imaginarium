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
#
# Indexes
#
#  index_images_on_space_id  (space_id)
#
# Foreign Keys
#
#  fk_rails_...  (space_id => spaces.id)
#
class Image < ApplicationRecord

  BAN_AFTER_BLAMES = 2

  belongs_to :space
  has_many :likes
  has_many :blames
  has_one_attached :generated

  after_create :generate

  scope :ordered, -> { order(likes_count: :desc, created_at: :desc)}
  scope :not_blamed, -> { where('images.blames_count < ?', BAN_AFTER_BLAMES)}
  scope :filtered, -> { not_blamed.ordered }

  def liked?(user)
    likes.where(user: user).exists?
  end

  def like!(user)
    if liked?(user)
      likes.where(user: user).destroy_all
    else
      likes.where(user: user).create
    end
  end

  def blamed?(user)
    blames.where(user: user).exists?
  end

  def blame!(user)
    if blamed?(user)
      blames.where(user: user).destroy_all
    else
      blames.where(user: user).create
    end
  end

  def to_s
    "#{prompt}"
  end

  protected

  def generate
    artifact = Stability.generate prompt
    self.update_column :seed, artifact.seed 
    io = StringIO.new artifact.binary
    generated.attach  io: io,
                      filename: 'generated.png',
                      content_type: 'image/png'
  end
end
