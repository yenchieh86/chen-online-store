class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :order_status, foreign_key: true
      t.decimal :item_total, precision: 10, scale: 2, default: 0, null: false
      t.decimal :tax, precision: 10, scale: 2, default: 0, null: false
      t.decimal :shipping, precision: 10, scale: 2, default: 0, null: false
      t.decimal :order_total, precision: 10, scale: 2, default: 0, null: false

      t.timestamps
    end
  end
end
