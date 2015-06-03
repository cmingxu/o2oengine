class CreateLbProducts < ActiveRecord::Migration
  def change
    create_table :lb_products do |t|
      t.string :name
      t.string :water_type
      t.string :brand
      t.string :container_type
      t.integer :sales
      t.integer :price
      t.integer :position
      t.text :desc
      t.string :icon

      t.timestamps null: false
    end
  end
end
