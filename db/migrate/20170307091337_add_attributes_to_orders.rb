class AddAttributesToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :total_weight, :decimal, precision: 10, scale: 2, default: "0.0"
    add_column :orders, :total_width, :decimal, precision: 10, scale: 2, default: "0.0"
    add_column :orders, :total_height, :decimal, precision: 10, scale: 2, default: "0.0"
    add_column :orders, :total_length, :decimal, precision: 10, scale: 2, default: "0.0"
  end
end