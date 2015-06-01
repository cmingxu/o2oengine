class AddDescToBrand < ActiveRecord::Migration
  def change
    add_column :lb_brands, :desc, :text
  end
end
