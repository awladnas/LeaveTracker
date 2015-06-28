class AddColumnSupervisorMessageToLeaves < ActiveRecord::Migration
  def change
    add_column :leaves, :supervisor_message, :text
  end
end
