class RenameIdentifierToDomainForSpace < ActiveRecord::Migration[7.0]
  def change
    rename_column :spaces, :slug, :domain
  end
end
