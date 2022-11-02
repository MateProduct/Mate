class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uni
      t.string :password
      t.string :uname
      t.string :lionmail
      t.string :phone
      t.string :contact
      t.string :time_slot
      t.text :description
      t.text :skills

      t.timestamps null: false
    end
    add_index :users, :uni
  end
end
