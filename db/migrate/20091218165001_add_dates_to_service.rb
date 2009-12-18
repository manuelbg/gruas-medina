class AddDatesToService < ActiveRecord::Migration
  def self.up
    add_column :services, :contact_date, :datetime
    add_column :services, :end_date, :datetime
  end

  def self.down
    remove_column :services, :end_date
    remove_column :services, :contact_date
  end
end
