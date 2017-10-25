class Property < ApplicationRecord
  belongs_to :landlord
  has_one :property_address
  has_many :private_details
  has_many :private_details_types, through: :private_details
  has_many :details
  has_many :details_types, through: :details
  has_many :interior_details
  has_many :interior_details_types, through: :interior_details
  has_many :exterior_details
  has_many :exterior_details_types, through: :exterior_details


  def address(id)
      address = PropertyAddress.find_by(id: id)
      if address.nil?
        address = PropertyAddress.new(street: "N/A", number: "N/A")
      else
        address
      end
  end
end
