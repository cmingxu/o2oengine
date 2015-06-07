class AddGiveForFreeToOrder < ActiveRecord::Migration
  def change
    add_column :lb_orders, :give_for_free, :boolean
  end
end
