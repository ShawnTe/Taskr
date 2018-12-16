class RenameSuppliesToSupplyDetails < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :supplies, :supply_details
  end

  def self.down
    rename_table :supply_details, :supplies
  end
end
