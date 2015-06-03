class CreateUserWechats < ActiveRecord::Migration
  def change
    create_table :user_wechats do |t|
      t.integer :user_id
      t.string :openid
      t.string :nickname
      t.string :sex
      t.string :language
      t.string :province
      t.string :city
      t.datetime :subscribe_time
      t.string :unionid
      t.string :headimg

      t.timestamps null: false
    end
  end
end
