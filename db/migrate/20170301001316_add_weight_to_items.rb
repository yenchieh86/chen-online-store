class AddWeightToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :weight, :decimal, precision: 10, scale: 2, default: 0
    add_column :items, :width, :decimal, precision: 10, scale: 2, default: 0
    add_column :items, :height, :decimal, precision: 10, scale: 2, default: 0
    add_column :items, :length, :decimal, precision: 10, scale: 2, default: 0
  end
end
