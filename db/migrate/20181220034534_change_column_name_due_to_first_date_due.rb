class ChangeColumnNameDueToFirstDateDue < ActiveRecord::Migration[5.2]
  def change
    rename_column :tasks, :due, :first_due_date
  end
end
