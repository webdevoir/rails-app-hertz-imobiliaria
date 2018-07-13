class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def index
    if params[:query].nil?
      @properties = Property.all
    else
      @properties = Property.fast_search(params[:query])
    end

    @markers = build_marker_for_maps(@properties)

    render layout: "search-layout"
  end

  def show

    @property = Property.find(params[:id])
    @contact_form = ContactForm.new
    impressionist(@property, "Page View")
    @area = !@property.property_area.nil? ? @property.property_area : PropertyArea.new
    @address = !@property.property_address.nil? ? @property.property_address : PropertyAddress.new
    @details = @property.property_details
    @value = !@property.property_value.nil? ? @property.property_value : PropertyValue.new(rent: 0, condominium: 0, iptu: 0)
    @property_coodinates = {lat: @address.latitude, lng: @address.longitude}
    render layout: "client-layout"
  end

  def home
    @properties_rent = Property.where(rent: true, featured:true, published: true).order(:created_at).limit(10)
    @properties_sale = Property.where(sale: true, featured:true, published: true).order(:created_at).limit(10)
    render layout: 'landing-page'
  end

  private

  def build_marker_for_maps(properties)
    markers = []
    properties.each do |property|
      add = property.property_address
      unless add.nil?
        unless add.latitude.nil? || add.longitude.nil?
          markers << {lat: add.latitude, lng: add.longitude, id: add.property_id}
        end
      end
    end
    return markers
  end

end
