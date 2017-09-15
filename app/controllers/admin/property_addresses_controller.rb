class Admin::PropertyAddressesController < ApplicationController

  def new
    @property_address = PropertyAddress.new
    @landlord = Landlord.find(params[:landlord_id])
    @property = @landlord.properties.find(params[:property_id])
  end

  def create
    @property_address = PropertyAddress.new(property_address_params)
    @landlord = Landlord.find(params[:landlord_id])
    @property_address.property = @landlord.properties.find(params[:property_id])
    if @property_address.save!
      redirect_to new_admin_landlord_property_property_areas(@landlord, @property_address.property)
    else
      render :new
    end
  end

  private

  def property_address_params
    params.requiere(:property_address).permit(:cep, :country, :city, :neighborhood, :street, :number, :complement, :condo_name)
  end

end
