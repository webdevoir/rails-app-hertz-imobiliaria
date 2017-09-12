# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email:"test@test.com", password: "123123")
PrivateDetailsType.create(name:"area de serviço")
InteriorDetailsType.create(name: "canil")
DetailsType.create(name: "laje")
ExteriorDetailsType.create(name: "rua sem saida")

Landlord.create(user: User.first, name:"Juan Manuel Couso")
PropertyAddress.create(cep:"12123123")
Value.create(value: 100)
PropertyArea.create(total_area: 1000)

Property.create(landlord: Landlord.first, property_area: PropertyArea.first, value: Value.first, property_address: PropertyAddress.first, code: 23423)

PrivateDetail.create(property: Property.first, private_details_type: PrivateDetailsType.first)
Detail.create(property: Property.first, details_type: DetailsType.first)
InteriorDetail.create(property: Property.first, interior_details_type: InteriorDetailsType.first)
ExteriorDetail.create(property: Property.first, exterior_details_type: ExteriorDetailsType.first)



