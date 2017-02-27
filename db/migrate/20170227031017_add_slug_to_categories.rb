class AddSlugToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :slug, :string
    add_index :categories, :slug, unique: true
    add_index :categories, :title, unique: true
  end
end
