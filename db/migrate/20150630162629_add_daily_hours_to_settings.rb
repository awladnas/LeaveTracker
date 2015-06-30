class AddDailyHoursToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :daily_hours, :time, null: true
    add_column :settings, :daily_earned_hours, :time, null: true
  end
end
