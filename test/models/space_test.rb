# == Schema Information
#
# Table name: spaces
#
#  id                :uuid             not null, primary key
#  about             :text
#  additional_prompt :string
#  css               :text
#  domain            :string
#  home              :text
#  home_cta_button   :text
#  home_cta_text     :text
#  legal             :text
#  name              :string
#  sass              :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require "test_helper"

class SpaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
