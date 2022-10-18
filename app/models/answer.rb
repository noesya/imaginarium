# == Schema Information
#
# Table name: answers
#
#  id          :uuid             not null, primary key
#  value       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :uuid             not null
#  space_id    :uuid             not null
#  user_id     :uuid             not null
#
# Indexes
#
#  index_answers_on_question_id  (question_id)
#  index_answers_on_space_id     (space_id)
#  index_answers_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#  fk_rails_...  (space_id => spaces.id)
#  fk_rails_...  (user_id => users.id)
#
class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :space
  belongs_to :question

  has_and_belongs_to_many :images

  def prompt
    " #{value} #{question.additional_prompt}"
  end

  def to_s
    "#{value}"
  end
end
