class ContactFormMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_form_mailer.contact.subject
  #
  def contact(contact_details)
    @contact_details = contact_details

    mail(to: contact_details.email, subject: "Recebemos seu contato")
  end
end
