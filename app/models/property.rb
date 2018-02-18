class Property < ApplicationRecord
  is_impressionable

  belongs_to :landlord
  has_attachments :photos, maximum: 20
  has_one :property_address, dependent: :destroy
  has_one :property_area, dependent: :destroy
  has_one :property_value, dependent: :destroy
  has_many :property_details
  has_many :details_types, through: :property_details

  validates :construction_year, presence: true, numericality: { greater_than: 1900}
  validates :property_type, presence: true
  validates :bathrooms, numericality: { greater_than: -1}
  validates :garages, numericality: { greater_than: -1}
  validates :suites, numericality: { greater_than: -1}


  def self.fast_search(query)
    # sql_query = " \
    #     id ~ :query
    #   "
    #   # OR property_addresses.street ILIKE :query \
    #   # OR property_addresses.cep ILIKE :query \
    # where(sql_query, query: "%#{query}%")
    []
  end


  def address
      address = PropertyAddress.find_by(property_id: self.id)
      if address.nil?
        address = PropertyAddress.new(cep: 0, country: "BR",
                                      city: "", neighborhood: "",
                                      street: "", number: "",
                                      complement: "", condo_name: "",
                                      condo_name: "", latitude: 0, longitude:0)
      else
        address
      end
  end


  def value
      value = PropertyValue.find_by(property_id: self.id)
      if value.nil?
        value = PropertyValue.new(rent: 0, sell: 0, iptu: 0, condominium: 0)
      else
        value
      end
  end

  def area
      area = PropertyArea.find_by(property_id: self.id)
      if area.nil?
        area = PropertyArea.new(scale: "", total: 0, usable: 0, land: 0)
      else
        area
      end
  end
end
