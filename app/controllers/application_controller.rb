class ApplicationController < ActionController::Base

  def current_space
    @current_space ||= Space.find_by domain: request.domain(2)
  end
  helper_method :current_space

  def current_user
    @current_user ||= User.with_cookies cookies, current_space
  end
  helper_method :current_user
end
