class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :service_item
      t.references :warehouse, foreign_key: true

      t.timestamps
    end
  end
end
