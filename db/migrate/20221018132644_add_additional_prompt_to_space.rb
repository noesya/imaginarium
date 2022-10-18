class AddAdditionalPromptToSpace < ActiveRecord::Migration[7.0]
  def change
    add_column :spaces, :additional_prompt, :string
  end
end
