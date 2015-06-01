class CreateLbBrands < ActiveRecord::Migration
  def change
    create_table :lb_brands do |t|
      t.string :name
      t.string :water_type
      t.string :icon

      t.timestamps null: false
    end
  end
end
