class Admin::PropertyValuesController < ApplicationController
  def new
    @property_value = PropertyValue.new
    @landlord = Landlord.find(params[:landlord_id])
    @property = @landlord.properties.find(params[:property_id])
  end

  def create
    @property_value = PropertyValue.new(property_value_params)
    @landlord = Landlord.find(params[:landlord_id])
    @property = @landlord.properties.find(params[:property_id])
    @property_value.property = @property
    if @property_value.save!
      redirect_to admin_property_path(@property)
    else
      render :new
    end

  end

  private

  def property_value_params
  params.require(:property_value).permit(:value, :iptu, :condo_amout)
  end

end
