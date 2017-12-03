User.destroy_all

Landlord.destroy_all

Property.destroy_all

User.create(email:"test@test.com", password: "123123", id: 1)

landlords = []
properties = []
property_addresses = []

def rg_generator
 "#{rand(10..99).to_s}.#{rand(100..999).to_s}.#{rand(100..999).to_s}-#{rand(10..99).to_s}"
end

def cep_generator
 "#{rand(10000..99999).to_s}-#{rand(100..999).to_s}"
end

# 100.times {
#   landlords << {
#     name: BlaBla::Pessoa.nome,
#     rg: rg_generator,
#     cpf: BlaBla::CPF.formatado,
#     birthday: Faker::Date.birthday(20, 65).strftime('%d, %m, %Y'),
#     martial_status: ['solteiro', 'casado', 'separado', 'divorciado', 'viúvo'].sample,
#     profession: ['engenheiro', 'advogado', 'administrado', 'arquiteto', 'dono de empresa'].sample,
#     phone: Faker::PhoneNumber.phone_number,
#     email: Faker::Internet.email,
#     address: Faker::Address.street_address + " " + Faker::Address.secondary_address,
#     cep: cep_generator,
#     deposit: [true, false].sample,
#     adm_rate: rand(0.05..0.10).round(2),
#     first_rate: rand(0.05..0.10).round(2),
#     type: ['Conta corrente', 'Conta Pupança'].sample,
#     bank: ['Banco do Brasil', 'Bradesco', 'Itau', 'Satander' ]. sample,
#     agency: rand(1000..9999),
#     number: rand(10000..9999).to_s + "-" + rand(10..99).to_s,
#     user_id: User.first.id
#   }
# }

# properties << {
#       code: rand(1000...9999),
#       bussiness_type: ['venda', 'alugel'].sample,
#       property_type: ['residencial', 'comercial'].sample,
#       property_kind: ['casa', 'apartamento'].sample,
#       property_state: ['novo', 'otimo', 'bom', 'reformado'].sample,
#       position: ['norte', 'sul', 'oeste', 'leste'].sample,
#       style: ['Barroco', 'Neoclassicismo', 'Neogótico', 'Neocolonial', 'Modernista', 'Contemporâneo'].sample,
#       construction_year: rand(1930..2017),
#       bathrooms: rand(0..5),
#       rooms: rand(1..10),
#       garages: rand(0..5),
#       suites: rand(0..10),
#       description: Faker::Lorem.paragraph,
#       published: [false, true].sample,
#       conditions: Faker::Lorem.sentence
# }

property_addresses << {

    cep: cep_generator,
    country: 'Brasil',
    state: 'São Paulo',
    city: ['São Paulo', 'São Caetano do Sul', 'São Bernardo do Campo', 'Santo Andre'].sample,
    neighborhood: ['Barcelona', 'Boa Vista', 'Centro', 'Cerâmica' ,'Fundação', 'Jardim São Caetano', 'Mauá', 'Nova Gerty', 'Olímpico', 'Oswaldo Cruz', 'Prosperidade', 'Santa Maria', 'Santa Paula', 'Santo Antônio', 'São José'].sample,
    street: 'Rua ' + ['Arnaldo', 'Veira', 'João Castanha', 'Aranha', 'Simões'].sample,
    number: rand(1..9999).to_s,
    complement: "#{[*('A'..'Z')].sample}#{rand(1..999)}",
    condo_name: Faker::Lorem.word.capitalize
}

puts property_addresses








