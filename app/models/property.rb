class Property < ApplicationRecord
  belongs_to :landlord
  belongs_to :property_area
  belongs_to :property_address
  belongs_to :value
  has_many :private_details
  has_many :private_details_types, through: :private_details
  has_many :details
  has_many :details_types, through: :details
  has_many :interior_details
  has_many :interior_details_types, through: :interior_details
  has_many :exterior_details
  has_many :exterior_details_types, through: :exterior_details
end
