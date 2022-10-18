class FixLikesAndBlames < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :user
    remove_column :blames, :user
    add_reference :likes, :user, null: true, foreign_key: true, type: :uuid
    add_reference :blames, :user, null: true, foreign_key: true, type: :uuid
  end
end
