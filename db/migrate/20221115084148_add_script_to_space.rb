class AddScriptToSpace < ActiveRecord::Migration[7.0]
  def change
    add_column :spaces, :script, :text
  end
end
