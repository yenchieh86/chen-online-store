class DropOrderSatausTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :order_sataus
  end
end
