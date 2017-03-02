class AddVisitCountToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :visit_times, :integer, default: 0
  end
end
