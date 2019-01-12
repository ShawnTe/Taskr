class CreateTaskHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :task_histories do |t|
      t.references :task, foreign_key: true, index: true
      t.date :last_due_date, null: false

      t.timestamps
    end
  end
end
