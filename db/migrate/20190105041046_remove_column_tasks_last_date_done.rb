class RemoveColumnTasksLastDateDone < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :last_date_done
  end
end
