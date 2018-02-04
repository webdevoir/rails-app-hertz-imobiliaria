class PropertyDetail < ApplicationRecord
  belongs_to :property
  belongs_to :details_type
end
