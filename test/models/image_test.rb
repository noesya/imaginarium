# == Schema Information
#
# Table name: images
#
#  id         :uuid             not null, primary key
#  prompt     :text
#  seed       :string
#  user       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  space_id   :uuid             not null
#
# Indexes
#
#  index_images_on_space_id  (space_id)
#
# Foreign Keys
#
#  fk_rails_...  (space_id => spaces.id)
#
require "test_helper"

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
