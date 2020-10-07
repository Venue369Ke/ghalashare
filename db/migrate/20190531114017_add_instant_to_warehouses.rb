class AddInstantToWarehouses < ActiveRecord::Migration[5.2]
  def change
    add_column :warehouses, :instant, :integer, default: 1
  end
end
