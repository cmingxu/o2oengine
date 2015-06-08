class AddMobileToStaff < ActiveRecord::Migration
  def change
    add_column :staffs, :mobile, :string
  end
end
