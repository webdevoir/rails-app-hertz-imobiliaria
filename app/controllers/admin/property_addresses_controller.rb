class Admin::PropertyAddressesController < ApplicationController

  def create
    @property_address = PropertyAddress.new(property_address_params)
    @landlord = Landlord.find(params[:landlord_id])
    @property_address.property = @landlord.properties.find(params[:property_id])
    if @property_address.save!
      redirect_to area_admin_landlord_property_path(@landlord, @property_address.property)
    else
      render 'properties/address'
    end
  end

  private

  def property_address_params
    params.require(:property_address).permit(:cep, :country, :city, :neighborhood, :street, :number, :complement, :condo_name)
  end

end
