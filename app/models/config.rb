class Config < ApplicationRecord
  belongs_to :warehouse, optional: true
end
