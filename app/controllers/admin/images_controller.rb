class Admin::ImagesController < Admin::ApplicationController

  def index
    @images = Image.all.page params[:page]
    breadcrumb
  end
  
  def show
    @image = Image.find(params[:id])
    breadcrumb
  end

  protected

  def breadcrumb
    super
    add_breadcrumb 'Images', admin_images_path    
    add_breadcrumb @image, [:admin, @image] if @image
  end

end