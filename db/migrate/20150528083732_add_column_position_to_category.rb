class AddColumnPositionToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :position, :integer
  end
end
