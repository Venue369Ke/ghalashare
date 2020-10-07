class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address1
      t.string :address2
      t.string :postal_code
      t.string :city
      t.string :country
      t.references :warehouse, foreign_key: true

      t.timestamps
    end
  end
end
