class PrivateDetail < ApplicationRecord
  belongs_to :property
  belongs_to :private_details_type
end
