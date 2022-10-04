class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.text :prompt

      t.timestamps
    end
  end
end
