class CreateLeaves < ActiveRecord::Migration
  def change
    create_table :leaves do |t|
      t.integer :user_id
      t.string :leave_type
      t.string :leave_status
      t.date :leave_date

      t.timestamps
    end
  end
end
