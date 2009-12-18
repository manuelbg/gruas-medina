class CreateCranes < ActiveRecord::Migration
  def self.up
    create_table :cranes do |t|
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :cranes
  end
end
