class Service < ActiveRecord::Base
  attr_accessible :user_id, :file, :car_type_id, :car_model, :color, :board, :location_city_id, :references, :destination_city_id, :insured, :service_type_id, :price, :operator_id, :crane
end
