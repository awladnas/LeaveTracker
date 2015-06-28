class ChangeMessageType < ActiveRecord::Migration
  def change
    change_column :users, :supervisor_message, :text
  end
end
