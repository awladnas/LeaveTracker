class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_casual_left, :float
    add_column :users, :total_casual_consume, :float
    add_column :users, :total_sick_left, :float
    add_column :users, :total_sick_consume, :float
    add_column :users, :ttf_id, :integer, :null => false, :default => 0
  end
end
