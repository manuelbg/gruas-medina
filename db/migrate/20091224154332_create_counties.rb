class CreateCounties < ActiveRecord::Migration
  def self.up
    create_table :counties do |t|
      t.integer :state_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :counties
  end
end
