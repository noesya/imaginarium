class CreateJoinTableAnswerImage < ActiveRecord::Migration[7.0]
  def change
    create_table :answers_images do |t|
      t.references :answer, null: false, foreign_key: true, type: :uuid
      t.references :image, null: false, foreign_key: true, type: :uuid
    end
  end
end
