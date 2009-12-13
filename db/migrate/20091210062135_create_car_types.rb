class CreateCarTypes < ActiveRecord::Migration
  def self.up
    create_table :car_types do |t|
      t.integer :car_brand_id
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :car_types
  end
end
