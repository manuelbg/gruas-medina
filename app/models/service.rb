class Service < ActiveRecord::Base
  belongs_to :user
  belongs_to :car_brand
  belongs_to :car_type
  belongs_to :crane
  belongs_to :service_type
  belongs_to :operator
  belongs_to :location_state, :class_name => 'State'
  belongs_to :destination_state, :class_name => 'State'
  belongs_to :location_county, :class_name => 'County'
  belongs_to :destination_county, :class_name => 'County'
  belongs_to :county
  
  validates_presence_of :crane_id, :message => "Selecciona una Grua."
  validates_presence_of :operator_id, :message => "Selecciona un Operador."
  validates_presence_of :user_id, :message => "Selecciona la empresa de Asistencia."
  validates_presence_of :service_type_id, :message => "Selecciona el Tipo de Servicio."
  
  
  def location_county_name
    if self.location_county
      self.location_county.name
    else
      ''
    end
  end
  
  def location_county_name=(name)
    unless name.blank?
      if county = County.find_by_name(name)
        self.location_county_id = county.id
      end
    end
  end
  
  def destination_county_name
    if self.destination_county
      self.destination_county.name
    else
      ''
    end
  end
  
  def destination_county_name=(name)
    unless name.blank?
      if county = County.find_by_name(name)
        self.destination_county_id = county.id
      end
    end
  end
end
