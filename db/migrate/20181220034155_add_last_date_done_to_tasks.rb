class AddLastDateDoneToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :last_date_done, :date
  end
end
