class RenameContactsToContactDetails < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :contacts, :contact_details
  end

  def self.down
    rename_table :contact_details, :contacts
  end
end
