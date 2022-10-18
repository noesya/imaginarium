# == Schema Information
#
# Table name: questions
#
#  id                :uuid             not null, primary key
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
class Question < ApplicationRecord
  belongs_to :space
  has_many :answers

  scope :ordered, -> { order(:position) }

  def to_s
    "#{text}"
  end
end
