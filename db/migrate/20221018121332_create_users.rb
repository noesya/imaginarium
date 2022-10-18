class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.references :space, null: false, foreign_key: true, type: :uuid
      t.string :email

      t.timestamps
    end
  end
end
