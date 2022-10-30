class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, force: :cascade, primary_key: :uni, id: false do |t|
      t.string :uni, null: false, unique: true
      t.string :password
      t.string :uname
      t.timestamps null: false
    end
  end
end
