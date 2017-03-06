class AddTotalSpendToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :total_spend, :decimal, precision: 10, scale: 2, default: "0.0"
    add_column :users, :total_orders, :integer, default: 0
  end
end
