class AddContentToLeaves < ActiveRecord::Migration
  def change
    add_column :leaves, :content, :text
  end
end
