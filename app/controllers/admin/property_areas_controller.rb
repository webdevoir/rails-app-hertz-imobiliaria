class Admin::PropertyAreasController < ApplicationController
  def new
    @property_area = PropertyArea.new
    @landlord = Landlord.find(params[:landlord_id])
    @property = @landlord.properties.find(params[:property_id])
  end

  def create
  end
end
