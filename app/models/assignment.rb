class Assignment < ApplicationRecord
  belongs_to :warehouse, optional: true
  belongs_to :service, optional: true
  belongs_to :sector_experience, optional: true
  belongs_to :certificate, optional: true
  belongs_to :connection, optional: true
  belongs_to :equipment, optional: true
  belongs_to :warehousetype, optional: true
  belongs_to :config, optional: true
end
