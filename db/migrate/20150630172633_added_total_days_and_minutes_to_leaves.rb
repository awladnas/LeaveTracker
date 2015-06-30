class AddedTotalDaysAndMinutesToLeaves < ActiveRecord::Migration
  def change
    add_column :leaves, :total_days, :integer, default: 0
    add_column :leaves, :total_minutes, :string, null: true
  end
end
