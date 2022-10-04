# == Schema Information
#
# Table name: spaces
#
#  id         :uuid             not null, primary key
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Space < ApplicationRecord
  has_many :images

  def to_s
    "#{name}"
  end
end
