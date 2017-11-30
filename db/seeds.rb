# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Landlord.destroy_all

Property.destroy_all

User.destroy_all

User.create(email:"test@test.com", password: "123123")


landlord1 = [
  {


    name: "Juan Manuel Couso"
    rg: "V317245-U"
    cpg: "231.311.748-03"
    birthday: Date.new(1986,8,19)
    martial_status: "Solteiro"
    profession: "Engenheiro"
    phone: "11994325759"
    email: "juan.couso@gmail.com"
    address: "Rua Gavita, 754 Apt 102"
    cep: "04522032"
    deposit:
    adm_rate:
    cep:
    deposit:
    first_rate:
    type:
    bank:
    agency:
    number:
    user_id:
      t.string   "name"
    t.string   "rg"
    t.string   "cpf"
    t.date     "birthday"
    t.string   "martial_status"
    t.string   "profession"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "cep"
    t.boolean  "deposit"
    t.decimal  "adm_rate"
    t.decimal  "first_rate"
    t.string   "type"
    t.string   "bank"
    t.string   "agency"
    t.string   "number"
    t.integer  "user_id"

  }
]

