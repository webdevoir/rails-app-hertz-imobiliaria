class ContactForm < ApplicationRecord
  belongs_to :property

  validates :name, presence: true
  validates :telefone, presence: true
  validates :email, presence: true
end
