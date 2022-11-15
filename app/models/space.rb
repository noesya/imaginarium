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
#  script            :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Space < ApplicationRecord
  has_many :images
  has_many :users
  has_many :questions
  has_many :answers
  has_many :likes, through: :images
  has_many :blames, through: :images

  has_one_attached_deletable :logo
  has_one_attached_deletable :logo_footer
  has_one_attached_deletable :share_overlay

  before_validation :css_save

  def prompt
    " #{random_prompt}"
  end

  def url
    Rails.env.development?  ? "http://#{domain}:3000"
                            : "https://#{domain}"
  end

  def to_s
    "#{name}"
  end

  protected

  def random_prompt
    additional_prompt.to_s.split('|').sample
  end

  def css_save
    self.css = sass.blank? ? '' : SassC::Engine.new(sass, syntax: :sass, style: :compressed).render
  end
end
