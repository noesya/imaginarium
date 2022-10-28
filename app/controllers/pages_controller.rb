class PagesController < ApplicationController
  def index
    if current_space.nil?
      # www.imaginarium.live
      @images = Image.filtered.limit(48)
      render :index_no_space
    else
      # Any specific space
      @images = current_space.images.filtered.limit(48)
      @home = current_space.home.to_s
      @home_cta_text = current_space.home_cta_text.to_s
      @home_cta_button = current_space.home_cta_button || 'Participer'
    end
  end

  def about
    @about = current_space.about.to_s
  end

  def legal
    @legal = current_space.legal.to_s
  end

  def style
    render inline: current_space.css
  end
end