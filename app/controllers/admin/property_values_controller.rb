class PropertyValuesController < ApplicationController
  def new
    @property_value = PropertyValue.new
    @landlord = Landlord.find(params[:landlord])
    @property = @landlord.properties.find(params[:property])
  end

  def create
  end
end
