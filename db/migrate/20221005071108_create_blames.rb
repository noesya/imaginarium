class CreateBlames < ActiveRecord::Migration[7.0]
  def change
    create_table :blames, id: :uuid do |t|
      t.references :image, null: false, foreign_key: true, type: :uuid
      t.string :user

      t.timestamps
    end
  end
end
