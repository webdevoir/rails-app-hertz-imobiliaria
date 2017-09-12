class DetailsType < ApplicationRecord
  has_many :details
  has_many :properties, through: :details
end
