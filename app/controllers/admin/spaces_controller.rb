class Admin::SpacesController < Admin::ApplicationController
  before_action :set_space, only: %i[ show edit update destroy ]

  def index
    @spaces = Space.all
    breadcrumb
  end

  def show
    breadcrumb
    @questions = @space.questions.ordered
    @images = @space.images.ordered_by_date.page params[:images_page]
    @users = @space.users.page params[:users_page]
  end

  def new
    breadcrumb
    @space = Space.new
  end

  def edit
    breadcrumb
    add_breadcrumb 'Modifier'
  end

  def create
    @space = Space.new(space_params)
    if @space.save
      redirect_to [:admin, @space], notice: "Space was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @space.update(space_params)
      redirect_to [:admin, @space], notice: "Space was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @space.destroy
    redirect_to admin_spaces_url, notice: "Space was successfully destroyed."
  end

  protected

  def breadcrumb
    super
    add_breadcrumb 'Espaces', admin_spaces_path
    if @space
      @space.persisted? ? add_breadcrumb(@space, [:admin, @space])
                        : add_breadcrumb('Nouvel espace')
    end
  end

  private
  
    def set_space
      @space = Space.find(params[:id])
    end

    def space_params
      params.require(:space).permit(:name, :domain, :additional_prompt)
    end
end
