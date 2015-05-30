class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :name
      t.integer :branch_id
      t.string :login
      t.string :encrypted_password
      t.string :salt
      t.string :avatar
      t.string :last_login_ip
      t.datetime :last_login_at

      t.timestamps null: false
    end
  end
end
