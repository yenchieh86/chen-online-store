class AddPriceToItems < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :price, :integer
    add_column :items, :price, :decimal, precision: 10, scale: 2, default: 0, null: false
    add_column :items, :status, :integer, default: 0, null: false
  end
end
