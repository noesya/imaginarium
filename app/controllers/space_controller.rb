class SpaceController < ApplicationController
  before_action :load_space

  def index
  end

  def generate_image
    @image = Image.new(image_params)
    @image.space = @space
    @image.save
    redirect_to show_image_path(@space.slug, @image.id)
  end

  def show_image
    @image = @space.images.find params[:image_id]
  end

  protected

  def image_params
    params.require(:image).permit(:prompt)
  end

  def load_space
    @space = Space.find_by slug: params[:space_slug]
  end
end