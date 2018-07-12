class Admin::PropertyAreasController < ApplicationController

  def create
    @property_area = PropertyArea.new(property_area_params)
    @property = @property_area.property
    if @property_area.save
      redirect_to value_admin_property_path(@property_area.property)
    else
      render 'admin/properties/area'
    end
  end

  def update
    @property_area = PropertyArea.find(params[:id])
    @property = @property_area.property
    if @property_area.update(property_area_params)
      redirect_to admin_property_path(@property_area.property)
    else
      render 'admin/properties/area'
    end
  end

  private

  def property_area_params
    params.require(:property_area).permit(:property_id, :scale, :total, :usable, :land)
  end
end
