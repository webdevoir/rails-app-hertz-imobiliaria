class Admin::PropertyValuesController < ApplicationController

  def create
    @property_value = PropertyValue.new(property_value_params)
    @property = @property_value.property
    if @property_value.save
      redirect_to photos_admin_property_path(@property_value.property)
    else
      render 'admin/properties/value'
    end

  end

  def update
    @property_value = PropertyValue.find(params[:id])
    @property = @property_value.property
    if @property_value.update(property_value_params)
      redirect_to admin_property_path(@property_value.property)
    else
      render 'admin/properties/value'
    end
  end

  private

  def property_value_params
  params.require(:property_value).permit(:property_id, :value, :iptu, :condo_amout, :sell, :rent, :installments, :number_of_installments, :condominium)
  end

end
