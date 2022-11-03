# == Schema Information
#
# Table name: questions
#
#  id                :uuid             not null, primary key
#  active            :boolean          default(TRUE)
#  additional_prompt :string           default("")
#  position          :integer          default(0)
#  text              :text             default("")
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  space_id          :uuid             not null
#
# Indexes
#
#  index_questions_on_space_id  (space_id)
#
# Foreign Keys
#
#  fk_rails_...  (space_id => spaces.id)
#
require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
