class AddStartDateToService < ActiveRecord::Migration
  def self.up
    add_column :services, :start_date, :datetime
  end

  def self.down
    remove_column :services, :start_date
  end
end
