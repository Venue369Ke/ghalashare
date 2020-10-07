# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
SectorExperience.destroy_all
Warehousetype.destroy_all
Certificate.destroy_all
Config.destroy_all
Equipment.destroy_all
Connection.destroy_all
Service.destroy_all
Company.destroy_all
User.destroy_all
WarehouseCategory.destroy_all


user_ids=[]
type_ids=[]
cert_ids=[]
exp_ids=[]
config_ids=[]
eq_ids=[]
con_ids=[]
serve_ids=[]
company_ids=[]
warehouse_cats=[]

user_ids << User.create(fullname:"Shop n ship", email: "admin@shopnship.co.ke", password: "D&D4life!", password_confirmation: "D&D4life!").id
user_ids << User.create(fullname:"Denis PwC", email: "denis.wambua@pwc.com", password: "D&D4life!", password_confirmation: "D&D4life!").id

p "#{user_ids.count} users created"

warehouse_cats << WarehouseCategory.create(category: "Bonded",category_description: "A public or privately owned warehouse where dutiable goods are stored pending payment of duty or removal under bond. The storage or delivery of goods are under the supervision of customs officers and if the warehouse is privately owned the keeper has to enter into a bond as indemnity in respect of the goods deposited, which may not be delivered without a release from the customs.").id
warehouse_cats << WarehouseCategory.create(category: "Non-Bonded",category_description: "A public warehouse is a storage facility open to any firm or individual in need of space to store goods in exchange for monthly rent. The arrangement could be temporary or long term. Renters will generally pay per square, pallet or foot they use in the warehouse.").id

p "#{warehouse_cats.count} Warehouse Categories created"
    company_ids <<  Company.create(company_name: "Unlimited directions", address1: "Milimani",address2:"",address3:"",city:"Nairobi",zipcode:"00519" ,country:"Kenya",VATnumber:"AOYTRW",description:"Description of my company",user_id: 1).id
    company_ids <<  Company.create(company_name: "Unlimited directions2", address1: "Mlimani",address2:"",address3:"",city:"Nairobi",zipcode:"00519"  ,country:"Kenya",VATnumber:"AOYTRW",description:"Description of my company",user_id: 2).id
      company_ids <<  Company.create(company_name: "Unlimited directions3", address1: "Mlimani",address2:"",address3:"",city:"Nairobi",zipcode:"00519"  ,country:"Kenya",VATnumber:"AOYTRW",description:"Description of my company",user_id: 1).id
        company_ids <<  Company.create(company_name: "Unlimited directions4", address1: "Mlimani",address2:"",address3:"",city:"Nairobi",zipcode:"00519"  ,country:"Kenya",VATnumber:"AOYTRW",description:"Description of my company",user_id: 2).id
p "#{company_ids.count} companies created"




type_ids << Warehousetype.create(type_item: "Block Warehouse").id
type_ids << Warehousetype.create(type_item: "Cold Warehouse").id
type_ids << Warehousetype.create(type_item: "Dangerous goods").id
type_ids << Warehousetype.create(type_item: "External Space Open").id
type_ids << Warehousetype.create(type_item: "Fully Automated Warehouse").id
type_ids << Warehousetype.create(type_item: "Guarded warehouse").id
type_ids << Warehousetype.create(type_item: "High-Bay-Racking").id
type_ids << Warehousetype.create(type_item: "Locked Warehouse").id
type_ids << Warehousetype.create(type_item: "Sheltered Outdoor Space").id
type_ids << Warehousetype.create(type_item: "Shelving Storage").id



p "#{type_ids.count} warehousetypes created"


cert_ids << Certificate.create(cert_item: "AEO").id
cert_ids << Certificate.create(cert_item: "BImSchG").id
cert_ids << Certificate.create(cert_item: "Bio/Organic Certification").id
cert_ids << Certificate.create(cert_item: "HACCP").id
cert_ids << Certificate.create(cert_item: "IFS Food").id
cert_ids << Certificate.create(cert_item: "IFS Logistics").id
cert_ids << Certificate.create(cert_item: "ISO14001").id
cert_ids << Certificate.create(cert_item: "ISO28000").id
cert_ids << Certificate.create(cert_item: "ISO50001").id
cert_ids << Certificate.create(cert_item: "ISO9001").id
cert_ids << Certificate.create(cert_item: "SQAS").id
cert_ids << Certificate.create(cert_item: "TAPA FSR").id


p "#{cert_ids.count} certificates created"



exp_ids << SectorExperience.create(experience_item: "Automotive").id
exp_ids << SectorExperience.create(experience_item: "Aviation").id
exp_ids << SectorExperience.create(experience_item: "Chemicals").id
exp_ids << SectorExperience.create(experience_item: "Construction").id
exp_ids << SectorExperience.create(experience_item: "Consumer electronics").id
exp_ids << SectorExperience.create(experience_item: "E-Commerce").id
exp_ids << SectorExperience.create(experience_item: "FMCG").id
exp_ids << SectorExperience.create(experience_item: "Fashion").id
exp_ids << SectorExperience.create(experience_item: "textiles").id
exp_ids << SectorExperience.create(experience_item: "Hazardous materials").id
exp_ids << SectorExperience.create(experience_item: "Industrials").id
exp_ids << SectorExperience.create(experience_item: "Manufacturing").id
exp_ids << SectorExperience.create(experience_item: "Perishable goods").id
exp_ids << SectorExperience.create(experience_item: "Retail").id
exp_ids << SectorExperience.create(experience_item: "Technology").id


p "#{exp_ids.count} SectorExperiences created"


config_ids << Config.create(config_item: "Ground Level Access").id
config_ids << Config.create(config_item: "Lifting Ramp").id
config_ids << Config.create(config_item: "Ramps").id
config_ids << Config.create(config_item: "Rear Loading and Unloading").id
config_ids << Config.create(config_item: "Side Loading and Unloading").id
config_ids << Config.create(config_item: "Sprinkler System").id

p "#{config_ids.count} Configs created"


eq_ids << Equipment.create(equipment_item: "1.5 tons forklift truck").id
eq_ids << Equipment.create(equipment_item: "3 tons forklift truck").id
eq_ids << Equipment.create(equipment_item: "5 tons forklift truck").id
eq_ids << Equipment.create(equipment_item: "8 tons forklift truck").id
eq_ids << Equipment.create(equipment_item: "Crane (over 30t)").id
eq_ids << Equipment.create(equipment_item: "Crane (up to 10t)").id
eq_ids << Equipment.create(equipment_item: "Crane (up to 20t)").id
eq_ids << Equipment.create(equipment_item: "Crane (up to 30t)").id
eq_ids << Equipment.create(equipment_item: "E-pallet Stackers").id
eq_ids << Equipment.create(equipment_item: "Picking Trolley").id


p "#{eq_ids.count} Equipment created"


con_ids << Connection.create(connection_item: "Airport").id
con_ids << Connection.create(connection_item: "Rail").id
con_ids << Connection.create(connection_item: "Road").id
con_ids << Connection.create(connection_item: "Waterway").id


p "#{con_ids.count} Connections created"

serve_ids << Service.create(service_item: "Container Loading").id
serve_ids << Service.create(service_item: "Customs Clearance").id
serve_ids << Service.create(service_item: "Display Building").id
serve_ids << Service.create(service_item: "Disposal").id
serve_ids << Service.create(service_item: "Exchange of Empties").id
serve_ids << Service.create(service_item: "Inventory").id
serve_ids << Service.create(service_item: "Kit-Building").id
serve_ids << Service.create(service_item: "Labeling").id
serve_ids << Service.create(service_item: "Packaging").id
serve_ids << Service.create(service_item: "Repacking Work").id
serve_ids << Service.create(service_item: "Repair Work").id
serve_ids << Service.create(service_item: "Returns").id
serve_ids << Service.create(service_item: "Sequencing").id
serve_ids << Service.create(service_item: "Transportation").id


p "#{serve_ids.count} Services created"
