class AddReadyToImages < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :ready, :boolean, default: false
  end
end
