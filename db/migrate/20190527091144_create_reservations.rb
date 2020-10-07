class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :warehouse, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.integer :price

      t.timestamps
    end
  end
end
