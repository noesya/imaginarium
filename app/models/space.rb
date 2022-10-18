# == Schema Information
#
# Table name: spaces
#
#  id                :uuid             not null, primary key
#  additional_prompt :string
#  name              :string
#  slug              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Space < ApplicationRecord
  has_many :images
  has_many :users
  has_many :questions

  def to_s
    "#{name}"
  end
end
