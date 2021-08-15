class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :crypted_password
      t.string :salt
      t.integer :role, null:false, defaut: 0

      t.timestamps
      t.index :email, unique: true
    end
  end
end
