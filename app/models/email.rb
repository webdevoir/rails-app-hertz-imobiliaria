class Email < ApplicationRecord
  belongs_to :landlord

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Use um email valido"},
                    uniqueness: { message: "Voce já usou esse email"},
                    length: {minimum: 5, maximum: 25}, allow_blank: true
end
