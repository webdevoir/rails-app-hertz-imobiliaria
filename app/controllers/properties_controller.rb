class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def index
    if params[:query].nil?
      @properties = Property.all
    else
      @properties = Property.fast_search(params[:query])
    end
      render layout: "client-layout"
  end

  def show
    @property = Property.find(params[:id])
    impressionist(@property, "Page View")
    @address = @property.address
    @area = @property.area
    @value = @property.value
    @property_coodinates = {lat: @address.latitude, lng: @address.longitude}
    render layout: "client-layout"
  end

  def home
    @properties_rent = Property.where(rent: true, published:true).order(:created_at).limit(10)
    @properties_sale = Property.where(sale: true, published:true).order(:created_at).limit(10)
    render layout: 'landing-page'
  end

end
