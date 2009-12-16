class AddStatusToService < ActiveRecord::Migration
  def self.up
    add_column :services, :status, :string
  end

  def self.down
    remove_column :services, :status
  end
end
