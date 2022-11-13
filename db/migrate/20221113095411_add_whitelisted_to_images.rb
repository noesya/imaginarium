class AddWhitelistedToImages < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :whitelisted, :boolean, default: false
  end
end
