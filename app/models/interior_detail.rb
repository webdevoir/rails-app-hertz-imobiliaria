class InteriorDetail < ApplicationRecord
  belongs_to :property
  belongs_to :interior_details_type
end
