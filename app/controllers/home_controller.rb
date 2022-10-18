
class HomeController < ApplicationController
  def index
    @images = Image.filtered.limit(100)
  end
end