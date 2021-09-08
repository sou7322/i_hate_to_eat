class AddReferenceToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :dietary_reference_intake, foreign_key: true
  end
end
