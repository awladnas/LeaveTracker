class ChangeDailyHoursNameOfSettings < ActiveRecord::Migration
  def change
    rename_column :settings, :daily_hours, :daily_minutes
    rename_column :settings, :daily_earned_hours, :daily_earned_minutes
  end
end
