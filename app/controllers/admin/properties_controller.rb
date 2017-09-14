class Admin::PropertiesController < ApplicationController

  def new
    @landlord = Landlord.find(params[:landlord_id])
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.landlord = Landlord.find(params[:landlord_id])
    if @property.save!
      redirect_to admin_landlord_path(@property.landlord)
    else
      render :new
    end
  end

  private

  def property_params
    params.require(:property).permit(:code, :bussiness_type, :property_kind, :property_state, :position, :style,
      :construction_year, :bathrooms, :rooms, :garages, :suites, :description, :conditions)
  end

end
