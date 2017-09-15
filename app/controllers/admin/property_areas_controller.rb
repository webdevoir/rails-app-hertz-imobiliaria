class Admin::PropertyAreasController < ApplicationController
  def new
    @property_area = PropertyArea.new
    @landlord = Landlord.find(params[:landlord_id])
    @property = @landlord.properties.find(params[:property_id])
  end

  def create
    @property_area = PropertyArea.new(property_area_params)
    @landlord = Landlord.find(params[:landlord_id])
    @property = @landlord.properties.find(params[:property_id])
    @property_area.property = @property
    if @property.save
      redirect_to new_admin_landlord_property_property_values_path(@landlord, @property )
    else
      render :new
    else

  end

  private

  def property_area_params
    params.require(:property_area).permit(:scale, :total_area, :usable_area, :area_land)
  end
end
