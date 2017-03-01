class AddWeightToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :weight, :decimal, precision: 10, scale: 2, default: 0
    add_column :order_items, :width, :decimal, precision: 10, scale: 2, default: 0
    add_column :order_items, :height, :decimal, precision: 10, scale: 2, default: 0
    add_column :order_items, :length, :decimal, precision: 10, scale: 2, default: 0
    
    remove_column :orders, :item_total, :decimal
    remove_column :orders, :shipping, :decimal
    add_reference :orders, :shipping, foreign_key: true
    
  end
end
