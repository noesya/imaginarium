# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  email      :string
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
class User < ApplicationRecord
  belongs_to :space
  has_many :images

  def self.with_cookies(cookies, space)
    if cookies[:user].present?
      user = where(id: cookies[:user], space: space).first_or_create
    else
      user = where(space: space).create
      cookies[:user] ||= user.id
    end
    user
  end

  def to_s
    "#{id}"
  end
end