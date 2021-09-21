class RenameExpiesAtColumnToSuggestions < ActiveRecord::Migration[6.0]
  def change
    rename_column :suggestions, :expies_at, :expires_at
  end
end
