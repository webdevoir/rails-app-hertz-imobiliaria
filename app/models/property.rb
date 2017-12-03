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


  def address
      address = PropertyAddress.find_by(property_id: self.id)
      if address.nil?
        address = PropertyAddress.new(street: "N/A", number: "N/A")
      else
        address
      end
  end
end
