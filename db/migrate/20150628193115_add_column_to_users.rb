class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :supervisor_message, :string
    remove_column :users, :total_sick_left
    remove_column :users, :total_casual_left
    rename_column :users, :ttf_id, :supervisor
  end
end
