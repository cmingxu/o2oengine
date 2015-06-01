class CreateLbProducts < ActiveRecord::Migration
  def change
    create_table :lb_products do |t|
      t.string :name
      t.integer :brand_id
      t.integer :coupon_count
      t.integer :reward_count
      t.string :water_type
      t.integer :price
      t.text :desc
      t.string :icon

      t.timestamps null: false
    end
  end
end
