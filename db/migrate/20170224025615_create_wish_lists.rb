class CreateWishLists < ActiveRecord::Migration[5.0]
  def change
    create_table :wish_lists do |t|
      t.references :user, foreign_key: true
      t.integer :item_id

      t.timestamps
    end
  end
end
