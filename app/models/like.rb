# == Schema Information
#
# Table name: likes
#
#  id         :uuid             not null, primary key
#  user       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_id   :uuid             not null
#
# Indexes
#
#  index_likes_on_image_id  (image_id)
#
# Foreign Keys
#
#  fk_rails_...  (image_id => images.id)
#
class Like < ApplicationRecord
  belongs_to :image
  after_create :denormalize
  after_destroy :denormalize

  protected

  def denormalize
    image.update_column :likes_count, image.likes.count
  end
end
