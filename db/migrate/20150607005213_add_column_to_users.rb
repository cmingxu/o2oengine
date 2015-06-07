class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :next_time_free, :boolean
  end
end
