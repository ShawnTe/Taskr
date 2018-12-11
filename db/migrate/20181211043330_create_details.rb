class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.references :todo, polymorphic: true, index: true

      t.timestamps
    end
  end
end
