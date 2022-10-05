# == Schema Information
#
# Table name: blames
#
#  id         :uuid             not null, primary key
#  user       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image_id   :uuid             not null
#
# Indexes
#
#  index_blames_on_image_id  (image_id)
#
# Foreign Keys
#
#  fk_rails_...  (image_id => images.id)
#
class Blame < ApplicationRecord
  belongs_to :image
  after_create :denormalize
  after_destroy :denormalize

  protected

  def denormalize
    image.update_column :blames_count, image.blames.count
  end
end
