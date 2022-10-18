class SpaceController < ApplicationController
  before_action :load

  def index
    @images = @space.images.filtered.limit(48)
    @questions = @space.questions.ordered
  end

  def generate_image
    @image = Image.new(image_params)
    @image.space = @space
    @image.user = @user
    @image.save
    redirect_to show_image_path(@space.slug, @image.id)
  end

  def show_image
  end

  def like_image
    Like.toggle! @image, @user
    redirect_to show_image_path(@space.slug, @image.id)
  end

  def blame_image
    Blame.toggle! @image, @user
    redirect_to show_image_path(@space.slug, @image.id)
  end

  protected

  def image_params
    params.require(:image).permit(:prompt)
  end

  def load
    @space = Space.find_by slug: params[:space_slug]
    @user = User.with_cookies cookies, @space
    @image = @space.images.find params[:image_id] if params.has_key? :image_id
  end
end