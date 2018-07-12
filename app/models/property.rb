class Property < ApplicationRecord
  is_impressionable

  belongs_to :landlord
  belongs_to :business_type
  belongs_to :property_type

  has_one :property_address, dependent: :destroy
  has_one :property_area, dependent: :destroy
  has_one :property_value, dependent: :destroy

  has_many :property_details
  has_many :details_types, through: :property_details, dependent: :destroy

  has_many :contact_forms, dependent: :destroy

  has_attachments :photos, maximum: 20

  validates :sale, presence: {unless: :rent?, message: "Escolha pelos menos um tipo de negociação" }
  validates :rent, presence: {unless: :sale?, message: "Escolha pelos menos um tipo de negociação"}
  validates :construction_year, numericality: { greater_than: 1900 }, allow_blank: true
  validates :property_type_id, presence: true
  validates :business_type_id, presence: true
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
