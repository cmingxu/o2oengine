class CreateLbOrders < ActiveRecord::Migration
  def change
    create_table :lb_orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity
      t.integer :staff_id
      t.string :status
      t.boolean :delay
      t.datetime :deliver_begin_at
      t.datetime :reached_at
      t.integer :price
      t.string :order_num
      t.string :prepay_id
      t.datetime :paid_at
      t.string :body
      t.string :transaction_id
      t.string :spbill_create_ip
      t.string :notify_url
      t.string :bank_type

      t.timestamps null: false
    end
  end
end
