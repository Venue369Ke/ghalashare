class CreateWarehouseCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :warehouse_categories do |t|
      t.string :category
      t.text :category_description
      t.references :warehouse, foreign_key: true

      t.timestamps
    end
  end
end
