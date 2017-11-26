class Admin::PropertyValuesController < ApplicationController

  def create
    @property_value = PropertyValue.new(property_value_params)
    @property_value.property = Property.find(params[:property_id])
    if @property_value.save!
      redirect_to photos_admin_landlord_property_path(@property_value.property.landlord, @property_value.property)
    else
      render :new
    end

  end

  def update
  end

  private

  def property_value_params
  params.require(:property_value).permit(:value, :iptu, :condo_amout)
  end

end
