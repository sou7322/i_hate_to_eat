class AddColumnSubnameToFood < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :subname, :string
  end
end
