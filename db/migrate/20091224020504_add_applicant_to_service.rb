class AddApplicantToService < ActiveRecord::Migration
  def self.up
    add_column :services, :applicant, :string
  end

  def self.down
    remove_column :services, :applicant
  end
end
