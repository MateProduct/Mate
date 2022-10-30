class AddAvailableTimeToUser < ActiveRecord::Migration
  def change
    add_column :users, :time_slot, :string
  end
end
