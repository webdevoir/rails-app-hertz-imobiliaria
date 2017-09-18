class Admin::PropertiesController < ApplicationController

  def new
    @landlord = Landlord.find(params[:landlord_id])
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.landlord = Landlord.find(params[:landlord_id])
    if @property.save!
      redirect_to new_admin_landlord_property_property_addresses_path(@property.landlord, @property)
    else
      render :new
    end
  end

  def show
    @property = Property.find(params[:id])
    @address = PropertyAddress.where(property_id: @property).first
    @area = PropertyArea.where(property_id: @property).first
    @value = PropertyValue.where(property_id: @property).first
  end

  private

  def property_params
    params.require(:property).permit(:code, :bussiness_type, :property_kind, :property_state, :position, :style,
      :construction_year, :bathrooms, :rooms, :garages, :suites, :description, :conditions)
  end

end
