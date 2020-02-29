class RenameStatusColumToTasks < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :status, :title
  end
end
