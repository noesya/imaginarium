# == Schema Information
#
# Table name: images
#
#  id           :uuid             not null, primary key
#  blacklisted  :boolean          default(FALSE)
#  blames_count :integer          default(0)
#  likes_count  :integer          default(0)
#  prompt       :text
#  ready        :boolean          default(FALSE)
#  seed         :string
#  user         :string
#  whitelisted  :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  space_id     :uuid             not null
#  user_id      :uuid
#
# Indexes
#
#  index_images_on_space_id  (space_id)
#  index_images_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (space_id => spaces.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
