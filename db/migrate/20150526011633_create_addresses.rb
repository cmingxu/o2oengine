class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :name
      t.string :provice
      t.string :city
      t.string :detail_address
      t.string :postal_code
      t.string :phone

      t.timestamps null: false
    end
  end
end
