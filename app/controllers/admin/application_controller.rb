class Admin::ApplicationController < ApplicationController
  layout 'admin/layouts/application'
  http_basic_authenticate_with  name: ENV['ADMIN_NAME'],
                                password: ENV['ADMIN_PASSWORD']

  protected

  def breadcrumb
    add_breadcrumb 'Tableau de bord', admin_root_path
  end
end
