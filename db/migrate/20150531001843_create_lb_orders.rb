class CreateLbOrders < ActiveRecord::Migration
  def change
    create_table :lb_orders do |t|
      t.integer :user_id
      t.integer :coupon_id
      t.string :product_id
      t.integer :quantity
      t.integer :staff_id
      t.string :status
      t.boolean :delay
      t.datetime :deliver_begin_at
      t.datetime :reached_at

      t.timestamps null: false
    end
  end
end
