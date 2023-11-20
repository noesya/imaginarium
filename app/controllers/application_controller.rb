class ApplicationController < ActionController::Base
  include WithErrors

  before_action :ensure_space

  def current_space
    @current_space ||= Space.find_by domain: request.domain(2)
  end
  helper_method :current_space

  def current_user
    @current_user ||= User.with_cookies cookies, current_space
  end
  helper_method :current_user

  def embedded?
    params.has_key?(:mode) && params[:mode] == 'embed'
  end
  helper_method :embedded?

  def default_url_options
    options = {}
    options[:mode] = params[:mode] if params.has_key? :mode
    options
  end

  private

  def ensure_space
    render_forbidden unless current_space
  end
end
