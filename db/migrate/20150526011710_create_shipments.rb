class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.integer :address_id
      t.integer :order_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
