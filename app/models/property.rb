class Property < ApplicationRecord
  is_impressionable

  belongs_to :landlord

  has_attachments :photos, maximum: 20

  has_one :property_address, dependent: :destroy
  has_one :property_area, dependent: :destroy
  has_one :property_value, dependent: :destroy
  has_many :property_details
  has_many :details_types, through: :property_details, dependent: :destroy

  has_many :contact_forms, dependent: :destroy

  validates :construction_year, numericality: { greater_than: 1900}, allow_blank: true
  validates :property_type, presence: true
  validates :bathrooms, numericality: { greater_than: -1}
  validates :garages, numericality: { greater_than: -1}
  validates :suites, numericality: { greater_than: -1}


  def self.fast_search(query)
    # sql_query = " \
    #     id ~ :query
    #   "
    #   # OR property_addresses.street ILIKE :query \
    #   # OR property_addresses.cep ILIKE :query \
    # where(sql_query, query: "%#{query}%")
    []
  end
end
