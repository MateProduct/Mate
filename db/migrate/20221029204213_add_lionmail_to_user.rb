class AddLionmailToUser < ActiveRecord::Migration
  def change
    add_column :users, :lionmail, :string
  end
end
