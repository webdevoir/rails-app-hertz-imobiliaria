class ExteriorDetailsType < ApplicationRecord
  has_many :exterior_details
  has_many :properties, through: :exterior_details
end
