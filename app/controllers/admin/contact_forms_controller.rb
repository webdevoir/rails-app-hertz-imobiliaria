class Admin::ContactFormsController < ApplicationController

  def index
    @contact_forms = ContactForm.all.order(:created_at)
  end

  def show

  end

  def destroy
    @contact_form = ContactForm.find(params[:id])
    @contact_form.destroy
    redirect_to admin_contact_forms_path
  end

end
