class Admin::PropertyAddressesController < ApplicationController
  def create
    @property_address = PropertyAddress.new(property_address_params)
    if @property_address.save!
      redirect_to details_admin_property_path(@property_address.property)
    else
      render 'properties/address'
    end
  end

  def update
    @property_address = PropertyAddress.find(params[:id])
    if PropertyAddress.update(property_address_params)
      redirect_to details_admin_property_path(@property_address.property)
    else
      render address_admin_property(@property_address.property)
    end
  end

  private

  def property_address_params
    params.require(:property_address).permit(:id, :property_id, :cep, :country, :city, :neighborhood, :street, :number, :complement, :condo_name)
  end

end
