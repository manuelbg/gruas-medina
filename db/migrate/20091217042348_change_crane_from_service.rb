class ChangeCraneFromService < ActiveRecord::Migration
  def self.up
    remove_column :services, :crane
    add_column :services, :crane_id, :integer
  end

  def self.down
    remove_column :services, :crane_id
    add_column :services, :crane
  end
end
