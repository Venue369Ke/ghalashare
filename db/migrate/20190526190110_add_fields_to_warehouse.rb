class AddFieldsToWarehouse < ActiveRecord::Migration[5.2]
  def change
    add_column :warehouses, :latitude, :float
    add_column :warehouses, :longitude, :float
  end
end
