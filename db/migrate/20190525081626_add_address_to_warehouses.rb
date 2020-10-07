class AddAddressToWarehouses < ActiveRecord::Migration[5.2]
  def change
    add_column :warehouses, :address, :string
    add_column :warehouses, :active, :boolean
  end
end
