class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :total_price
      t.string :order_status
      t.string :ship_status
      t.string :payment_status

      t.timestamps null: false
    end
  end
end
