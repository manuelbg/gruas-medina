class CreateNeighbourhoods < ActiveRecord::Migration
  def self.up
    create_table :neighbourhoods do |t|
      t.integer :county_id
      t.string :name
      t.string :category
      t.string :zip

      t.timestamps
    end
  end

  def self.down
    drop_table :neighbourhoods
  end
end
