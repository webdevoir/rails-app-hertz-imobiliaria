class Admin::PropertyAddressesController < ApplicationController
  def create
    @property_address = PropertyAddress.new(property_address_params)
    @property = @property_address.property
    if @property_address.save
      redirect_to details_admin_property_path(@property_address.property)
    else
      render 'admin/properties/address'
    end
  end

  def update
    @property_address = PropertyAddress.find(params[:id])
    @property = @property_address.property
    if @property_address.update(property_address_params)
      redirect_to admin_property_path(@property_address.property)
    else
      render 'admin/properties/address'
    end
  end

  private

  def property_address_params
    params.require(:property_address).permit(:id, :property_id, :cep, :country,
      :city, :state, :neighborhood, :street, :number, :complement, :condo_name)
  end

end
