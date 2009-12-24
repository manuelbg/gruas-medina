class ChangeUbicationsToService < ActiveRecord::Migration
  def self.up
    change_column :services, :location_city_id, :string
    rename_column :services, :location_city_id, :location
    change_column :services, :destination_city_id, :string
    rename_column :services, :destination_city_id, :destination
  end

  def self.down
    change_column :services, :location, :integer
    rename_column :services, :location, :location_city_id
    change_column :services, :destination, :integer
    rename_column :services, :destination, :destination_city_id
  end
end
