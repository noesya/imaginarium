class TurnImageIdToUuid < ActiveRecord::Migration[7.0]
  def change
    add_column :images, :uuid, :uuid, default: "gen_random_uuid()", null: false
    change_table :images do |t|
      t.remove :id
      t.rename :uuid, :id
    end
    execute "ALTER TABLE images ADD PRIMARY KEY (id);"
  end
end
