class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions, id: :uuid do |t|
      t.references :space, null: false, foreign_key: true, type: :uuid
      t.text :text, default: ''
      t.string :additional_prompt, default: ''
      t.integer :position, default: 0

      t.timestamps
    end
  end
end
