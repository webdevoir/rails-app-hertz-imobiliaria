# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Landlord.destroy_all

# Property.destroy_all

# User.destroy_all

# User.create(email:"test@test.com", password: "123123")

landlords = []

def rg_generator
 "#{rand(10..99).to_s}.#{rand(100..999).to_s}.#{rand(100..999).to_s}-#{rand(10..99).to_s}"
end

100.times {
  landlords << {
    name: BlaBla::Pessoa.nome,
    rg: rg_generator,
    cpf: BlaBla::CPF.formatado
  }
}




puts landlords





# landlord1 = [
#   {

#       t.string   "name"
#     t.string   "rg"
#     t.string   "cpf"
#     t.date     "birthday"
#     t.string   "martial_status"
#     t.string   "profession"
#     t.string   "phone"
#     t.string   "email"
#     t.string   "address"
#     t.string   "cep"
#     t.boolean  "deposit"
#     t.decimal  "adm_rate"
#     t.decimal  "first_rate"
#     t.string   "type"
#     t.string   "bank"
#     t.string   "agency"
#     t.string   "number"
#     t.integer  "user_id"

#   }
# ]

