class CreateCarBrands < ActiveRecord::Migration
  def self.up
    create_table :car_brands do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :car_brands
  end
end
