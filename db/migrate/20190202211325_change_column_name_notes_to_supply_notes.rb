class ChangeColumnNameNotesToSupplyNotes < ActiveRecord::Migration[5.2]
  def change
    rename_column :supply_details, :notes, :supply_notes
  end
end
