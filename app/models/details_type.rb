class DetailsType < ApplicationRecord
  has_many :property_details
  has_many :properties, through: :property_details, dependent: :destroy
end
