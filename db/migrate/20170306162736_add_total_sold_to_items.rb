class AddTotalSoldToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :total_sold, :integer, default: 0
    add_column :items, :average_rating, :decimal, precision: 2, scale: 1, default: "0.0"
    add_column :items, :total_ratings, :integer, default: 0
    add_column :items, :total_reviews, :integer, default: 0
  end
end
