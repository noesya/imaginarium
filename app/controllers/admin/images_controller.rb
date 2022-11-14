class Admin::ImagesController < Admin::ApplicationController

  def index
    @images = Image.all.ready.ordered_by_date.page params[:images_page]
    breadcrumb
  end
  
  def show
    @image = Image.find(params[:id])
    breadcrumb
  end

  def blamed
    @space = Space.find(params[:space_id])
    @images = @space.images.blamed.ordered_by_date.page params[:page]
    add_breadcrumb 'Tableau de bord', admin_root_path
    add_breadcrumb 'Espaces', admin_spaces_path
    add_breadcrumb @space, [:admin, @space]
    add_breadcrumb 'Images signalées'
  end

  def whitelist
    @image = Image.find(params[:id])
    @image.whitelisted = true
    @image.save
    redirect_to blamed_admin_space_images_path(@image.space)
  end

  protected

  def breadcrumb
    super
    add_breadcrumb 'Images', admin_images_path    
    add_breadcrumb @image, [:admin, @image] if @image
  end

end
