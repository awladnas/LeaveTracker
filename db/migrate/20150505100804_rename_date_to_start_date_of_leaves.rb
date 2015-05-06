class RenameDateToStartDateOfLeaves < ActiveRecord::Migration
  def change
    rename_column :leaves, :leave_date, :start_date
    add_column :leaves, :end_date, :date
  end
end
