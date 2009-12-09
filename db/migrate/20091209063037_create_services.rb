class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.integer :user_id
      t.string :file
      t.integer :car_type_id
      t.string :car_model
      t.string :color
      t.string :board
      t.integer :location_city_id
      t.text :references
      t.integer :destination_city_id
      t.boolean :insured
      t.integer :service_type_id
      t.integer :price
      t.integer :operator_id
      t.string :crane
      t.timestamps
    end
  end
  
  def self.down
    drop_table :services
  end
end
