class AddQuantityToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :quantity, :integer, null: false, default: 0
  end
end
