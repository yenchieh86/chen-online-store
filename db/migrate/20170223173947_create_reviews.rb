class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.string :body
      t.references :user, foreign_key: true, null: false
      t.references :item, foreign_key: true, null: false

      t.timestamps
    end
  end
end
