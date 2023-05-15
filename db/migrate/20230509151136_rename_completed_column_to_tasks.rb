class RenameCompletedColumnToTasks < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasks, :Completed, :completed
  end
end
