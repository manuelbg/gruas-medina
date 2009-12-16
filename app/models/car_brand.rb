class CarBrand < ActiveRecord::Base
  has_many :car_types
  
  attr_accessible :name
end
