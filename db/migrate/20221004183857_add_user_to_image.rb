class AddUserToImage < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :user, :string
  end
end
