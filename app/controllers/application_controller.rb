class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_contact_form_count

  def set_contact_form_count
    @contact_form_count = ContactForm.count
  end
end
