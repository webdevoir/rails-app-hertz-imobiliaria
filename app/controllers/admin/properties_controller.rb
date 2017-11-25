class Admin::PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def new
    @landlord = Landlord.find(params[:landlord_id])
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.landlord = Landlord.find(params[:landlord_id])
    if @property.save!
      redirect_to address_admin_landlord_property_path(@property.landlord, @property)
    else
      render :new
    end
  end

  def show
    @property = Property.find(params[:id])
    @address = PropertyAddress.where(property_id: @property).first
    @area = PropertyArea.where(property_id: @property).first
    @value = PropertyValue.where(property_id: @property).first
  end

  def address
    if PropertyAddress.where(property_id: params[:id]).empty?
      @property_address = PropertyAddress.new
    else
       @property_address = PropertyAddress.where(property_id: params[:id]).first
    end
    @landlord = Landlord.find(params[:landlord_id])
    @property = @landlord.properties.find(params[:id])
  end

  def area
    if PropertyArea.where(property_id: params[:id]).empty?
      @property_area = PropertyArea.new
    else
       @property_area = PropertyArea.where(property_id: params[:id]).first
    end
    @landlord = Landlord.find(params[:landlord_id])
    @property = @landlord.properties.find(params[:id])
  end

  def value
    if PropertyValue.where(property_id: params[:id]).empty?
      @property_value = PropertyValue.new
    else
       @property_area = PropertyValue.where(property_id: params[:id]).first
    end
    @landlord = Landlord.find(params[:landlord_id])
    @property = @landlord.properties.find(params[:id])
  end

  def photos
    @landlord = Landlord.find(params[:landlord_id])
    @property = Property.find(params[:id])
  end

  def deshbord
  end

  private

  def property_params
    params.require(:property).permit(:code, :bussiness_type, :property_kind, :property_state, :position, :style,
      :construction_year, :bathrooms, :rooms, :garages, :suites, :description, :conditions, photos: [])
  end

end
