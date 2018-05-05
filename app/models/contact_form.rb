class ContactForm < ApplicationRecord
  validates :name, presence: true
  validates :telefone, presence: true
  validates :email, presence: true
end
