class AddSlugToSpace < ActiveRecord::Migration[7.0]
  def change
    add_column :spaces, :slug, :string
  end
end
