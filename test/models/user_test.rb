# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  email      :string
#  pseudo     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  space_id   :uuid             not null
#
# Indexes
#
#  index_users_on_space_id  (space_id)
#
# Foreign Keys
#
#  fk_rails_...  (space_id => spaces.id)
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
