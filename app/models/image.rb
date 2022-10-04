# == Schema Information
#
# Table name: images
#
#  id          :uuid             not null, primary key
#  likes_count :integer          default(0)
#  prompt      :text
#  seed        :string
#  user        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  space_id    :uuid             not null
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

  belongs_to :space
  has_many :likes
  has_one_attached :generated

  after_create :generate

  scope :ordered, -> { order(likes_count: :desc, created_at: :desc)}

  def like!(user)
    if likes.where(user: user).exists?
      likes.where(user: user).destroy_all
    else
      likes.where(user: user).create
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
