class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :order_status, foreign_key: true
      t.decimal :item_total
      t.decimal :tax
      t.decimal :shipping
      t.decimal :order_total

      t.timestamps
    end
  end
end
