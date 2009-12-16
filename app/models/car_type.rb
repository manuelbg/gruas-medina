class CarType < ActiveRecord::Base
  belongs_to :car_brand
  
  attr_accessible :car_brand_id, :name
end
