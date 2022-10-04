class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes, id: :uuid do |t|
      t.references :image, null: false, foreign_key: true, type: :uuid
      t.string :user

      t.timestamps
    end
  end
end
