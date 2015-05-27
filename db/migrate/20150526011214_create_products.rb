class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :sku
      t.text :desc
      t.integer :quantity
      t.string :pic1
      t.string :pic2
      t.string :pic3
      t.string :pic4

      t.timestamps null: false
    end
  end
end
