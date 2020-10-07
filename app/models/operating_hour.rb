class OperatingHour < ApplicationRecord
  belongs_to :warehouse, optional: true
  
end
