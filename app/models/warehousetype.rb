class Warehousetype < ApplicationRecord
  belongs_to :warehouse, optional: true
  has_many :assignments
  has_many :warehouses, through: :assignments
end
