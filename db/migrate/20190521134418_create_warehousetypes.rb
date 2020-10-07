class CreateWarehousetypes < ActiveRecord::Migration[5.2]
  def change
    create_table :warehousetypes do |t|
      t.string :type_item
      t.references :warehouse, foreign_key: true

      t.timestamps
    end
  end
end
