class AddActiveToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_time_login, :date
  end
end
