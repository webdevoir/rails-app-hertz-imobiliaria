class Admin::PropertiesController < ApplicationController
  before_action :set_property, only: [:edit, :update, :show, :address, :area, :value, :photos, :destroy, :details]
  before_action :set_landlord, only: [:new, :edit]
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
    if @property.save!
      redirect_to address_admin_property_path(@property)
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
    @address = PropertyAddress.find_by(property_id: @property)
    @area = PropertyArea.find_by(property_id: @property)
    @value = PropertyValue.find_by(property_id: @property)
    @property_coodinates = {lat: @address.latitude, lng: @address.longitude}
  end

  def address
    if PropertyAddress.where(property_id: params[:id]).empty?
      @property_address = PropertyAddress.new
    else
       @property_address = PropertyAddress.find_by(property_id: params[:id])
    end
  end

  def area
    if PropertyArea.where(property_id: params[:id]).empty?
      @property_area = PropertyArea.new
    else
       @property_area = PropertyArea.find_by(property_id: params[:id])
    end
  end

  def value
    if PropertyValue.where(property_id: params[:id]).empty?
      @property_value = PropertyValue.new
    else
       @property_value = PropertyValue.find_by(property_id: params[:id])
    end
  end

  def photos
  end

  def dashboard
    @properties = Property.all
    @landlords = Landlord.all
    @data = []
    ((Date.today-30)...(Date.today+1)).map{ |date|
      #binding.pry
      [date.strftime("%F"), (date + 1).strftime("%F")] }.each do |date|
      total_of_day = 0
      @properties.each do |property|
        total_of_day += property.impressionist_count(filter: :ip_address, start_date: date[0], end_date: date[1] )
      end
      @data << [date[0], total_of_day]
    end
    @data
  end

  def details
    @property_details = PropertyDetail.where(property_id: params[:id]).map{ |detail| detail.details_type.name }
  end

  def destroy
    @property.destroy
    redirect_to admin_properties_path
  end

  private

  def set_landlord
    if params[:landlord]
      @landlord = Landlord.find(params[:landlord])
    elsif @property.landlord.present?
      @landlord = @property.landlord
    else
      @landlord = Landlord.new
    end
  end

  def set_property
    @property = Property.find(params[:id])
  end


  def property_params
    params.require(:property).permit(:id, :landlord_id, :code, :bussiness_type, :property_kind, :property_state, :position, :style,
      :construction_year, :bathrooms, :rooms, :garages, :suites, :description, :published, :conditions, photos: [])
  end

end
