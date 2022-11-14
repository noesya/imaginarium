class AddBlacklistedToImages < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :blacklisted, :boolean, default: false
  end
end
