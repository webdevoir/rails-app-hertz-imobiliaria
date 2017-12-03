User.destroy_all

Landlord.destroy_all

Property.destroy_all

User.create(email:"test@test.com", password: "123123", id: 1)

landlords = []

def rg_generator
 "#{rand(10..99).to_s}.#{rand(100..999).to_s}.#{rand(100..999).to_s}-#{rand(10..99).to_s}"
end

def cep_generator
 "#{rand(10000..99999).to_s}-#{rand(100..999).to_s}"
end

100.times {
  landlords << {
    name: BlaBla::Pessoa.nome,
    rg: rg_generator,
    cpf: BlaBla::CPF.formatado,
    birthday: Faker::Date.birthday(20, 65).strftime('%d, %m, %Y'),
    martial_status: ['solteiro', 'casado', 'separado', 'divorciado', 'viúvo'].sample,
    profession: ['engenheiro', 'advogado', 'administrado', 'arquiteto', 'dono de empresa'].sample,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    address: Faker::Address.street_address + " " + Faker::Address.secondary_address,
    cep: cep_generator,
    deposit: [true, false].sample,
    adm_rate: rand(0.05..0.10).round(2),
    first_rate: rand(0.05..0.10).round(2),
    type: ['Conta corrente', 'Conta Pupança'].sample,
    bank: ['Banco do Brasil', 'Bradesco', 'Itau', 'Satander' ]. sample,
    agency: rand(1000..9999),
    number: rand(10000..9999).to_s + "-" + rand(10..99).to_s,
    user_id: User.first.id
  }
}


# puts User.first.id
# puts User.first.id
# puts landlords





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

