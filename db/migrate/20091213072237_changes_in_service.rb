class ChangesInService < ActiveRecord::Migration
  def self.up
    change_column :services, :insured, :string
  end

  def self.down
    change_column :services, :insured, :boolean
  end
end
