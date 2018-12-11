class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :company
      t.string :name
      t.string :url
      t.string :work_phone
      t.string :mobile_phone
      t.text :notes
      t.string :email

      t.timestamps
    end
  end
end
