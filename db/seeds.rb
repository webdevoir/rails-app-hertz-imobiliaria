User.destroy_all

Landlord.destroy_all

Property.destroy_all

User.create(email:"test@test.com", password: "123123", id: 1)

urls = [
  'http://library.webster.edu/archives/buildings/images/webstervillageapartments.jpg',
  'https://res.cloudinary.com/apartmentlist/image/upload/t_fullsize/5b30c3a3b02ddebec2c24e66c51ba33c.jpg',
  'http://media.equityapartments.com/images/c_crop,x_0,y_0,w_1586,h_1080/c_fill,w_737,h_414/q_80/2584-4/harbor-steps-apartments-exterior.jpg',
  'http://profiles.sulekhalive.com/mstore/14041316/albums/default/thumbnailfull/3-bhk-apartments-in-asangaon-east-for-sale.jpg',
  'https://upload.wikimedia.org/wikipedia/commons/0/0f/Jardinette_Apartments%2C_Los_Angeles.JPG',
  'https://media-cdn.tripadvisor.com/media/photo-s/02/70/ed/40/view-of-apartments.jpg',
  'https://needamortgageloan.files.wordpress.com/2011/11/apartments.jpg',
  'https://images.trvl-media.com/hotels/5000000/4090000/4081100/4081097/4081097_99_z.jpg',
  'https://i.pinimg.com/originals/40/1b/88/401b883cc545fd04e0c8fb9d5c1f937a.jpg',
  'https://bloximages.newyork1.vip.townnews.com/stltoday.com/content/tncms/assets/v3/editorial/a/31/a318e7b8-e631-504a-b83e-0ae2b4fb4ef2/57a0cce8662bc.image.jpg',
  'https://resources.stuff.co.nz/content/dam/images/1/l/e/b/u/w/image.related.StuffLandscapeSixteenByNine.620x349.1ldjnc.png/1505071321440.jpg',
  'https://blog.rent.com/wp-content/uploads/2014/06/New-Apartment-Complex-the-Size-of-a-City-Block.jpg',
  'https://images.pexels.com/photos/534233/pexels-photo-534233.jpeg?h=350&auto=compress&cs=tinysrgb',
  'https://i.pinimg.com/originals/b1/b2/ed/b1b2ed87f97270e760eb423e3f8846e9.jpg',
  'https://media-cdn.tripadvisor.com/media/photo-s/01/19/9a/3d/front-view-of-apartments.jpg',
  'https://untappedcities-wpengine.netdna-ssl.com/wp-content/uploads/2013/08/Suburban-Houses-On-Top-of-Apartments-Upper-West-Side-2568-Broadway-NYC_4.jpg'
]


class Generator

  def rg_generator
   "#{rand(10..99).to_s}.#{rand(100..999).to_s}.#{rand(100..999).to_s}-#{rand(10..99).to_s}"
  end

  def cep_generator
   "#{rand(10000..99999).to_s}-#{rand(100..999).to_s}"
  end

  def landlord_genetator
    {
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
      number: rand(10000..9999).to_s + "-" + rand(10..99).to_s
    }
  end


  def property_generator
    {
      code: rand(1000...9999),
      bussiness_type: ['venda', 'alugel'].sample,
      property_type: ['residencial', 'comercial'].sample,
      property_kind: ['casa', 'apartamento'].sample,
      property_state: ['novo', 'otimo', 'bom', 'reformado'].sample,
      position: ['norte', 'sul', 'oeste', 'leste'].sample,
      style: ['Barroco', 'Neoclassicismo', 'Neogótico', 'Neocolonial', 'Modernista', 'Contemporâneo'].sample,
      construction_year: rand(1930..2017),
      bathrooms: rand(0..5),
      rooms: rand(1..10),
      garages: rand(0..5),
      suites: rand(0..10),
      description: Faker::Lorem.paragraph,
      published: [false, true].sample,
      conditions: Faker::Lorem.sentence
    }
  end



  def property_address_generator
    {
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
  end

  def property_area_generator
    {
      scale: 'm2',
      total_area: rand(100...1500).round(2),
      usable_area: rand(100...1500).round(2),
      area_land:  rand(100...1500).round(2)
    }
  end


  def property_value_generator
    {
    value: rand(1000...99999),
    iptu: rand(300..999),
    condo_amount: rand(300..2000),
    rate: rand(0.1..0.2).round(2)
    }
  end

end

gen = Generator.new


puts gen.landlord_genetator
puts gen.property_generator
puts gen.property_address_generator
puts gen.property_area_generator
puts gen.property_value_generator













