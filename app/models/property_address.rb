class PropertyAddress < ApplicationRecord
  belongs_to :property

  def full_address
    "#{self.street} #{self.number}, #{self.city}, #{self.state}, #{self.country}"
end
