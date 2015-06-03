class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :name
      t.string :salt
      t.string :address
      t.string :phone
      t.string :encrypted_password
      t.string :last_login_at
      t.string :last_login_ip
      t.string :source
      t.integer :last_product_id
      t.integer :last_quantity

      t.timestamps null: false
    end
  end
end
