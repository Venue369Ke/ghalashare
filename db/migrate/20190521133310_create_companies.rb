class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :city
      t.string :zipcode
      t.string :country
      t.string :VATnumber
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
