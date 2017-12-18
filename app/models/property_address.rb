class PropertyAddress < ApplicationRecord
  belongs_to :property
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    "#{self.street} #{self.number}, #{self.city}, #{self.state}, #{self.country}"
  end

end

