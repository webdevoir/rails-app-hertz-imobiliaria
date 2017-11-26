class Admin::PropertyAreasController < ApplicationController

  def create
    @property_area = PropertyArea.new(property_area_params)
    @property_area.property = @landlord.properties.find(params[:property_id])
    if @property_area.save!
      redirect_to value_admin_landlord_property_path(@property_area.property.landlord, @property_area.property)
    else
      render 'properties/area'
    end

  end

  private

  def property_area_params
    params.require(:property_area).permit(:scale, :total_area, :usable_area, :area_land)
  end
end
