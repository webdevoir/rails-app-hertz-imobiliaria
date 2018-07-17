class Landlord < ApplicationRecord
  has_many :properties, dependent: :destroy

  has_many :emails, inverse_of: :landlord
  accepts_nested_attributes_for :emails, reject_if: :all_blank, allow_destroy: true

  has_many :phones, inverse_of: :landlord
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true, length: {minimum: 5, maximum: 50}, allow_blank: false
  # validates :rg, presence: true
  # validates :cpf, presence: true
  # validates :birthday, presence: true
  # validates :martial_status, presence: true
  # validates :profession, presence: true
  # # validates :cep, presence: true
  # # validates :state, presence: true
  # # validates :city, presence: true
  # # validates :neighborhood, presence: true
  # # validates :street, presence: true
  # validates :number, numericality: { only_integer: true }
  # # validates :deposit, presence: true
  # validates :adm_rate, presence: true
  # validates :first_rate, presence: true
  # validates :type_of_account, presence: true
  # validates :bank, presence: true
  # validates :agency, presence: true

  def self.search(query)
    sql_query = " \
        name ILIKE :query OR
        rg ILIKE :query OR
        cpf ILIKE :query OR
        email ILIKE :query
      "
    where(sql_query, query: "%#{query}%")
  end

end
