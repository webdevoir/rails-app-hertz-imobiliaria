class Landlord < ApplicationRecord
  belongs_to :user
  has_many :properties
  belongs_to :bank_account
end
