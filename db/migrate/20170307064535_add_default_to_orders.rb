class AddDefaultToOrders < ActiveRecord::Migration[5.0]
  def up
    change_column :orders, :item_total_quantity, :integer, default: 0
    change_column :orders, :shipping_id, :integer, default: 0
  end
  
  def down
    change_column :orders, :item_total_quantity, :integer
    change_column :orders, :shipping_id, :integer
  end
end
