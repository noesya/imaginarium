class AddFieldsToSpace < ActiveRecord::Migration[7.0]
  def change
    add_column :spaces, :home, :text
    add_column :spaces, :home_cta_text, :text
    add_column :spaces, :home_cta_button, :text
    add_column :spaces, :about, :text
    add_column :spaces, :sass, :text
    add_column :spaces, :css, :text
  end
end
