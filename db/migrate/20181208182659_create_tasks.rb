class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.date :due
      t.text :notes
      t.string :frequency_unit
      t.integer :frequency_number
      t.integer :user_id

      t.timestamps
    end
  end
end
