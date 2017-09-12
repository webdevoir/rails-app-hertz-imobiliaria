class PrivateDetailsType < ApplicationRecord
  has_many :private_details
  has_many :properties, through: :private_details
end
