class Admin::PropertiesController < ApplicationController
  before_action :set_landlord, only: [:new, :create, :edit, :update, :address, :area, :value, :photos, :details]
  before_action :set_property, only: [:edit, :update, :show, :address, :area, :value, :photos, :destroy, :details]
  autocomplete :details_type, :name

  def index
    if params[:query].nil?
      @properties = Property.all
    else
      @properties = Property.fast_search(params[:query])
    end
    @estados = PropertyAddress.states
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
    unless params[:landlord_id].nil?
      redirect_to  admin_landlord_path(params[:landlord_id]) if @property.update(property_params)
    else
      redirect_to  admin_property_path(params[:id]) if @property.update(property_params)
    end
  end

  def show
    @address = PropertyAddress.where(property_id: @property).first
    @area = PropertyArea.where(property_id: @property).first
    @value = PropertyValue.where(property_id: @property).first
    @property_coodinates = {lat: @address.latitude, lng: @address.longitude}
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

  def details
    @property_details = Detail.where(property_id: params[:id]).map{ |detail| detail.details_type.name }
  end

  def destroy
    @property.destroy
    redirect_to admin_properties_path
  end

  private

  def set_landlord
    unless params[:landlord_id].nil?
      @landlord = Landlord.find(params[:landlord_id])
    end
  end

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:id, :code, :bussiness_type, :property_kind, :property_state, :position, :style,
      :construction_year, :bathrooms, :rooms, :garages, :suites, :description, :published, :conditions, photos: [])
  end

end
