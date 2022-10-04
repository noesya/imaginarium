class ApplicationController < ActionController::Base
  before_action :set_cookie

  protected

  def set_cookie
    @user = cookies[:user] ||= SecureRandom.uuid
  end
end
