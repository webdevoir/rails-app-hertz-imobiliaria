class ContactFormsController < ApplicationController
  def create
    @contact_form = ContactForm.new(contact_form_params)
    @property = Property.find(params[:property_id])
    @contact_form.property = @property
    if @contact_form.save
      respond_to do |format|
        format.html { redirect_to property_path(@property)}
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'properties/show' }
        format.js
      end
    end
  end

  private

  def contact_form_params
    params.require(:contact_form).permit(:name, :telefone, :email, :property_id)
  end
end
