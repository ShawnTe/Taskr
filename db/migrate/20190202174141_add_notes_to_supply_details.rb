class AddNotesToSupplyDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :supply_details, :notes, :text
  end
end
