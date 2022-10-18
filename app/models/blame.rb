# == Schema Information
#
# Table name: blames
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_id   :uuid             not null
#  user_id    :uuid
#
# Indexes
#
#  index_blames_on_image_id  (image_id)
#  index_blames_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (image_id => images.id)
#  fk_rails_...  (user_id => users.id)
#
class Blame < ApplicationRecord
  belongs_to :image
  belongs_to :user
  after_create :denormalize
  after_destroy :denormalize

  def self.toggle!(image, user)
    if image.blamed_by?(user)
      unblame!(image, user)
    else
      blame!(image, user)
    end
  end

  def self.blame!(image, user)
    where(image: image, user: user).create
  end
  
  def self.unblame!(image, user)
    where(image: image, user: user).destroy_all
  end

  protected

  def denormalize
    image.update_column :blames_count, image.blames.count
  end
end
