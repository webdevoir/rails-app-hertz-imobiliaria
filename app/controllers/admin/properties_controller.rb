class Admin::PropertiesController < ApplicationController
  before_action :set_landlord, only: [:new, :create, :edit, :update, :address, :area, :value, :photos]
  before_action :set_property, only: [:edit, :update, :show, :address, :area, :value, :photos, :destroy]
  def index
    @estados = ["AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", "RJ", "RN", "RS", "RO", "RR", "SC", "SP", "SE", "TO"]
    if params[:query].nil?
      @properties = Property.all
    else
      @properties = Property.where(code: params[:query])
      # address = PropertyAddress(street: params[:query])
      #@properties << Property.where(code: params[:query])
    end
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.landlord = @landlord #Landlord.find(params[:landlord_id])
    if @property.save!
      redirect_to address_admin_landlord_property_path(@property.landlord, @property)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @property.update(property_params)
      redirect_to  admin_landlord_path(params[:landlord_id])
    end
  end

  def show
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
  end

  def area
    if PropertyArea.where(property_id: params[:id]).empty?
      @property_area = PropertyArea.new
    else
       @property_area = PropertyArea.where(property_id: params[:id]).first
    end
  end

  def value
    if PropertyValue.where(property_id: params[:id]).empty?
      @property_value = PropertyValue.new
    else
       @property_value = PropertyValue.where(property_id: params[:id]).first
    end
  end

  def photos
  end

  def dashboard
    @properties = Property.all
    @landlords = Landlord.all
  end

  def destroy
    @property.destroy
    redirect_to admin_properties_path
  end

  private

  def set_landlord
    @landlord = Landlord.find(params[:landlord_id])
  end

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:code, :bussiness_type, :property_kind, :property_state, :position, :style,
      :construction_year, :bathrooms, :rooms, :garages, :suites, :description, :conditions, photos: [])
  end

end
