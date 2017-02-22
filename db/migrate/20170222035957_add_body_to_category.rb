class AddBodyToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :body, :string
  end
end
