class CreateSupplies < ActiveRecord::Migration[5.2]
  def change
    create_table :supplies do |t|
      t.string :name
      t.string :size
      t.integer :quantity
      t.string :brand
      t.string :model
      t.string :source
      t.string :source_link
      t.string :how_to_link

      t.timestamps
    end
  end
end
