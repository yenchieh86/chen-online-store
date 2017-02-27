class CreateOrderStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :order_statuses do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
