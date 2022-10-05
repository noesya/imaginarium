class AddBlamesToImage < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :blames_count, :integer, default: 0
  end
end
