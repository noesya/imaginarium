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
require "test_helper"

class BlameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
