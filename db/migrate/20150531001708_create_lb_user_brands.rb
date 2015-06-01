class CreateLbUserBrands < ActiveRecord::Migration
  def change
    create_table :lb_user_brands do |t|
      t.integer :user_id
      t.integer :brand_id
      t.boolean :highlight

      t.timestamps null: false
    end
  end
end
