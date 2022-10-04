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
require "test_helper"

class LikeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
