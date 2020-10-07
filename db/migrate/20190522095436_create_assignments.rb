class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.references :warehouse, foreign_key: true
      t.references :service, foreign_key: true
      t.references :sector_experience, foreign_key: true
      t.references :certificate, foreign_key: true
      t.references :connection, foreign_key: true
      t.references :equipment, foreign_key: true
      t.references :warehousetype, foreign_key: true

      t.timestamps
    end
  end
end
