class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  layout 'landing-page'

  def index
      query = params[:index][:query]
      if query == ""
        @properties = Property.all
      else
        @properties = Property.where(code: query)
      end
  end

  def show
    @property = Property.find(params[:id])
    impressionist(@property, "Page View", :unique => [:session_hash])

    @address = PropertyAddress.where(property_id: @property).first
    @area = PropertyArea.where(property_id: @property).first
    @value = PropertyValue.where(property_id: @property).first
    #@property_coodinates = {lat: @address.latitude, lng: @address.longitude}
  end

  def home
    @properties_rent = Property.where(rent: true, published:true).order(:created_at).limit(10)
    @properties_sale = Property.where(sale: true, published:true).order(:created_at).limit(10)
  end

end
