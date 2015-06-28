class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.float :yearly_casual_leave
      t.float :yearly_sick_leave
      t.string :weekend_day_one
      t.string :weekend_day_two

      t.timestamps
    end
  end
end
