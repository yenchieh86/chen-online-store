class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :title,             null: false, default: ""
      t.integer :price,            null: false, default: 0
      t.text    :body

      t.timestamps
    end
  end
end
