class ContactFormsController < ApplicationController
  def create
    @contact_form = ContactForm.new(contact_form_params)
    @contact_form.property = Property.find(params[:property_id])
    if @contact_form.save
      flash[:notice] = "Seu contato foi enviado com sucesso"
      respond_to do |format|
        format.json
      end
    else
      respond_to do |format|
        # format.html { redirect_to properties_path(@contact_form.property), notice: 'Task was successfully destroyed.' }
        format.json { render json: @contact_form.errors, status: :unprocessable_entity  }
      end
    end
  end

  private

  def contact_form_params
    params.require(:contact_form).permit(:name, :telefone, :email, :property_id)
  end
end
