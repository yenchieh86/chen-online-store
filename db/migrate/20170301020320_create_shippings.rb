class CreateShippings < ActiveRecord::Migration[5.0]
  def change
    create_table :shippings do |t|
      t.string :title
      t.string :body
      t.decimal :price, precision: 10, scale: 2, default: "0.0"

      t.timestamps
    end
  end
end
