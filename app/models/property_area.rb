class PropertyArea < ApplicationRecord
  belongs_to :property

  validates :total, numericality: { greater_than: 1 }, allow_nil: true
  validates :usable, numericality: { greater_than: 1 }, allow_nil: true
  validates :land, numericality: { greater_than: 1 }, allow_nil: true

end
