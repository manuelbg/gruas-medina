class AddAutocompleteUbicationsToService < ActiveRecord::Migration
  def self.up
    add_column :services, :location_state_id, :integer
    add_column :services, :location_county_id, :integer
    add_column :services, :location_neighbourhood_id, :integer
    add_column :services, :destination_state_id, :integer
    add_column :services, :destination_county_id, :integer
    add_column :services, :destination_neighbourhood_id, :integer
    remove_column :services, :location
    remove_column :services, :destination
  end

  def self.down
    remove_column :services, :destination_neighbourhood_id
    remove_column :services, :destination_county_id
    remove_column :services, :destination_state_id
    remove_column :services, :location_neighbourhood_id
    remove_column :services, :location_county_id
    remove_column :services, :location_state_id
    add_column :services, :location, :text
    add_column :services, :destination, :text
  end
end
