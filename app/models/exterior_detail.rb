class ExteriorDetail < ApplicationRecord
  belongs_to :property
  belongs_to :exterior_details_type
end
