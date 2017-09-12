class Property < ApplicationRecord
  belongs_to :landlord
  has_many :private_details
  has_many :private_details_types, through: :private_details
  has_many :details
  has_many :details_types, through: :details
  has_many :interior_details
  has_many :interior_details_types, through: :interior_details
  has_many :exterior_details
  has_many :exterior_details_types, through: :exterior_details
end
