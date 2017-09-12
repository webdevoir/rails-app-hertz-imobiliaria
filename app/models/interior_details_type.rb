class InteriorDetailsType < ApplicationRecord
  has_many :interior_details
  has_many :properties, through: :interior_details
end
