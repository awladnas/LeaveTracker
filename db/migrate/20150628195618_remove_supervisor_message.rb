class RemoveSupervisorMessage < ActiveRecord::Migration
  def change
    remove_column :users, :supervisor_message
  end
end
