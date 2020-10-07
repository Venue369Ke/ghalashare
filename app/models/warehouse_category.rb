class WarehouseCategory < ApplicationRecord
  belongs_to :warehouse,optional: true
end
