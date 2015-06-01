class CreateLbCoupons < ActiveRecord::Migration
  def change
    create_table :lb_coupons do |t|
      t.integer :product_id
      t.integer :count
      t.integer :price
      t.integer :remain_count
      t.integer :user_id
      t.string :coupon_type
      t.string :prepare_id
      t.string :transaction_id

      t.timestamps null: false
    end
  end
end
