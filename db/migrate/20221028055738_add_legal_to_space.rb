class AddLegalToSpace < ActiveRecord::Migration[7.0]
  def change
    add_column :spaces, :legal, :text
  end
end
