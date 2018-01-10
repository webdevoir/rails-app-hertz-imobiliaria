class Property < ApplicationRecord
  belongs_to :landlord
  has_attachments :photos, maximum: 20
  has_one :property_address, dependent: :destroy
  has_one :property_area, dependent: :destroy
  has_one :property_value, dependent: :destroy
  has_many :private_details
  has_many :private_details_types, through: :private_details
  has_many :details
  has_many :details_types, through: :details
  has_many :interior_details
  has_many :interior_details_types, through: :interior_details
  has_many :exterior_details
  has_many :exterior_details_types, through: :exterior_details


  def self.fast_search(query)
    sql_query = " \
        code ILIKE :query
      "
          # OR property_addresses.street ILIKE :query \
      # OR property_addresses.cep ILIKE :query \
      #joins(:property_address).
    where(sql_query, query: "%#{query}%")
    #where(sql_query, query: "%#{query}%")
  end


  def address
      address = PropertyAddress.find_by(property_id: self.id)
      if address.nil?
        address = PropertyAddress.new(street: "N/A", number: "N/A")
      else
        address
      end
  end

  def value
      value = PropertyValue.find_by(property_id: self.id)
      if value.nil?
        value = PropertyValue.new
      else
        value
      end
  end

  def area
      area = PropertyArea.find_by(property_id: self.id)
      if area.nil?
        area = PropertyArea.new
      else
        area
      end
  end
end
