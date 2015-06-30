class ChangeDailyHoursTypeOfSettings < ActiveRecord::Migration
  def change
    change_column :settings, :daily_hours, :string, null: true
    change_column :settings, :daily_earned_hours, :string, null: true
  end
end
