class Admin::PropertyValuesController < ApplicationController

  def create
    @property_value = PropertyValue.new(property_value_params)
    if @property_value.save!
      redirect_to photos_admin_property_path(@property_value.property)
    else
      render :new
    end

  end

  def update
    @property_value = PropertyValue.find(params[:id])
    if PropertyValue.update(property_value_params)
      redirect_to photos_admin_property_path(@property_value.property)
    else
      render value_admin_property(@property_are.property)
    end
  end

  private

  def property_value_params
  params.require(:property_value).permit(:property_id, :value, :iptu, :condo_amout)
  end

end
