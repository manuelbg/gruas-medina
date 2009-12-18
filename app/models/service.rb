class Service < ActiveRecord::Base
  belongs_to :user
  belongs_to :car_brand
  belongs_to :car_type
  belongs_to :crane
  belongs_to :service_type
  belongs_to :operator
end
