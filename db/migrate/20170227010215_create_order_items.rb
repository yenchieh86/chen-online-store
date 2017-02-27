class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.references :item, foreign_key: true
      t.references :order, foreign_key: true
      t.decimal :unit_price, precision: 10, scale: 2, default: 0, null: false
      t.integer :quantity, default: 0, null: false
      t.decimal :total_price, precision: 10, scale: 2, default: 0, null: false

      t.timestamps
    end
  end
end
