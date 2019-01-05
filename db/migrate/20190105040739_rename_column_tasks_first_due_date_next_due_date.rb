class RenameColumnTasksFirstDueDateNextDueDate < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :first_due_date, :next_due_date
  end
end
