class Admin::PropertyAreasController < ApplicationController

  def create
    @property_area = PropertyArea.new(property_area_params)
    @landlord = Landlord.find(params[:landlord_id])
    @property = @landlord.properties.find(params[:property_id])
    @property_area.property = @property
    if @property_area.save!
      redirect_to new_admin_landlord_property_property_values_path(@landlord, @property)
    else
      render 'properties/area'
    end

  end

  private

  def property_area_params
    params.require(:property_area).permit(:scale, :total_area, :usable_area, :area_land)
  end
end
