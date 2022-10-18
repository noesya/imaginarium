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
require "test_helper"

class BlameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
