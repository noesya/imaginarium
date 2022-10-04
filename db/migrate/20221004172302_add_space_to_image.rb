class AddSpaceToImage < ActiveRecord::Migration[7.0]
  def change
    add_reference :images, :space, null: false, foreign_key: true, type: :uuid
  end
end
