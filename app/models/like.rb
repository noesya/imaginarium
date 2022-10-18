# == Schema Information
#
# Table name: likes
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_id   :uuid             not null
#  user_id    :uuid
#
# Indexes
#
#  index_likes_on_image_id  (image_id)
#  index_likes_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (image_id => images.id)
#  fk_rails_...  (user_id => users.id)
#
class Like < ApplicationRecord
  belongs_to :image
  belongs_to :user
  after_create :denormalize
  after_destroy :denormalize

  def self.toggle!(image, user)
    if image.liked_by?(user)
      unlike!(image, user)
    else
      like!(image, user)
    end
  end

  def self.like!(image, user)
    where(image: image, user: user).create
  end
  
  def self.unlike!(image, user)
    where(image: image, user: user).destroy_all
  end

  protected

  def denormalize
    image.update_column :likes_count, image.likes.count
  end
end
