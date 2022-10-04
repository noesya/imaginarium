class AddSeedToImages < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :seed, :string
  end
end
