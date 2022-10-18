class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :space, null: false, foreign_key: true, type: :uuid
      t.references :question, null: false, foreign_key: true, type: :uuid
      t.string :value

      t.timestamps
    end
  end
end
