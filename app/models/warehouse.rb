class Warehouse < ApplicationRecord
 enum instant: {Request: 0, Instant: 1}


  belongs_to :company, optional: true
  belongs_to :user
  #has_one :address, inverse_of: :warehouse
  #accepts_nested_attributes_for :address, reject_if: proc { |attributes| attributes[:address1].blank? }, allow_destroy: true

    has_many :assignments
    has_many :photos
    has_many :guest_reviews
    has_many :calendars

    has_many :services, through: :assignments
    has_many :sector_experiences, through: :assignments
    has_many :certificates, through: :assignments
    has_many :configs, through: :assignments
    has_many :connections, through: :assignments
    has_many :equipment, through: :assignments
    has_many :warehousetypes, through: :assignments
    has_many :reservations
    has_one  :warehousecategory



geocoded_by :address
after_validation :geocode, if: :address_changed?


def cover_photo(size)

  if self.photos.length > 0

    self.photos[0].image.url(size)
  else
"blank.jpg"

  end
end


    # Assigns a service
def assign_service(warehouse,services)
  services.each do |service|
assignments.create!(warehouse_id: warehouse.id, service_id: service.id)
end
end


# Assigns warehouse type
def assign_warehousetype(warehouse,warehousetypes)
warehousetypes.each do |warehousetype|
assignments.create!(warehouse_id: warehouse.id, warehousetype_id: warehousetype.id)
end
end

# Assigns sectorexperiences
def assign_sectorexperience(warehouse,sectorexperiences)
sectorexperiences.each do |sectorexperience|
assignments.create!(warehouse_id: warehouse.id, sector_experience_id: sectorexperience.id)
end
end


# Assigns configs
def assign_config(warehouse,configs)
configs.each do |config|
assignments.create!(warehouse_id: warehouse.id, config_id: config.id)
end
end

# Assigns connections
def assign_connection(warehouse,connections)
connections.each do |connection|
assignments.create!(warehouse_id: warehouse.id, connection_id: connection.id)
end
end

# Assigns equipment
def assign_equipment(warehouse,equipment)
equipment.each do |equip|
assignments.create!(warehouse_id: warehouse.id, equipment_id: equip.id)
end
end


#checks service availability

def check_service(service_array, i)
b=nil
    service_array.each do |service|
    if service.id !=i.id
    b =  false

    else
    b =  true

    end

return b

  end



end


def average_rating
 guest_reviews.count == 0 ? 0 :guest_reviews.average(:star).round(2).to_i

end







end
