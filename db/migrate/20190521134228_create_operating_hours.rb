class CreateOperatingHours < ActiveRecord::Migration[5.2]
  def change
    create_table :operating_hours do |t|
      t.time :monday_from
      t.time :monday_to
      t.time :tuesday_from
      t.time :tuesday_to
      t.time :wednesday_from
      t.time :wednesday_to
      t.time :thursday_from
      t.time :thursday_to
      t.time :friday_from
      t.time :friday_to
      t.time :sat_from
      t.time :sat_to
      t.time :sunday_from
      t.time :sunday_to
      t.references :warehouse, foreign_key: true

      t.timestamps
    end
  end
end
