
class HomeController < ApplicationController
  def index
    @images = Image.filtered.limit(96)
  end
end