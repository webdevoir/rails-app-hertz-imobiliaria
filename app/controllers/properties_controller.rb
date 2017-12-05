class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  layout 'landing-page', only: [:home]

  def index
  end

  def show
    @property = Property.find(params[:id])
    @address = PropertyAddress.where(property_id: @property).first
    @area = PropertyArea.where(property_id: @property).first
    @value = PropertyValue.where(property_id: @property).first
  end

  def home
    #@properties = Property.all.limit(20)
    @properties_rent = Property.where(bussiness_type: 'alugel').order(:created_at).limit(10)
    @properties_sale = Property.where(bussiness_type: 'venda').order(:created_at).limit(10)
  end

end
