class Admin::PropertyAddressesController < ApplicationController
  def create
    @property_address = PropertyAddress.new(property_address_params)
    if @property_address.save!
      redirect_to area_admin_property_path(@property_address.property)
    else
      render 'properties/address'
    end
  end

  def update
  end

  private

  def property_address_params
    params.require(:property_address).permit(:property_id, :cep, :country, :city, :neighborhood, :street, :number, :complement, :condo_name)
  end

end
