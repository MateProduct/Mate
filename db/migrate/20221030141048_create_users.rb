class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uni
      t.string :password
      t.string :uname

      t.timestamps null: false
    end
    add_index :users, :uni
  end
end
