class Admin::UsersController < Admin::ApplicationController

  def index
    @users = User.all.page params[:users_page]
    breadcrumb
  end
  
  def show
    @user = User.find(params[:id])
    @images = @user.images.page params[:images_page]
    @answers = @user.answers.page params[:answers_page]
    breadcrumb
  end

  protected

  def breadcrumb
    super
    add_breadcrumb 'Utilisateurs', admin_users_path    
    add_breadcrumb @user, [:admin, @user] if @user
  end

end
