class Admin::DashboardController < Admin::ApplicationController

  def index
    breadcrumb
    @spaces = Space.all
  end

end