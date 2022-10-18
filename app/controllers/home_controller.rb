
class HomeController < ApplicationController
  def index
    @images = Image.filtered.limit(48)
  end
end