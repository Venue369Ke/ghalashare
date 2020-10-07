json.extract! company, :id, :company_name, :address1, :address2, :address3, :city, :zipcode, :country, :VATnumber, :description, :user_id, :created_at, :updated_at
json.url company_url(company, format: :json)
