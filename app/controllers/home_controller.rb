class HomeController < ApplicationController
  def index
    if current_space.nil?
      # www.imaginarium.live
      @images = Image.filtered.limit(48)
      render :generic
    else
      # Any specific space
      @images = current_space.images.filtered.limit(48)
    end
  end
end