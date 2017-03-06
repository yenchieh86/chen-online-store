class AddItemTotalToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :item_total, :decimal, precision: 10, scale: 2, default: "0.0"
    add_column :orders, :item_total_quantity, :integer
  end
end
