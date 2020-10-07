class CreateSectorExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :sector_experiences do |t|
      t.string :experience_item
      t.references :warehouse, foreign_key: true

      t.timestamps
    end
  end
end
