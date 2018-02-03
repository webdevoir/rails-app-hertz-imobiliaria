class Admin::PropertyAreasController < ApplicationController

  def create
    @property_area = PropertyArea.new(property_area_params)
    if @property_area.save!
      redirect_to value_admin_property_path(@property_area.property)
    else
      render 'properties/area'
    end
  end

  def update
    @property_area = PropertyArea.find(params[:id])
    if PropertyArea.update(property_area_params)
      redirect_to value_admin_property_path(@property_area.property)
    else
      render area_admin_property(@property_are.property)
    end
  end

  private

  def property_area_params
    params.require(:property_area).permit(:property_id, :scale, :total_area, :usable_area, :area_land)
  end
end
