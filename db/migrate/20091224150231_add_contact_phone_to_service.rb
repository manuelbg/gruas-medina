class AddContactPhoneToService < ActiveRecord::Migration
  def self.up
    add_column :services, :contact_phone, :string
  end

  def self.down
    remove_column :services, :contact_phone
  end
end
