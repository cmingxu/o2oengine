class AddPositionToTables < ActiveRecord::Migration
  def change
    add_column :lb_brands, :position, :integer
    add_column :lb_products, :position, :integer
  end
end
