class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  layout 'landing-page', only: [:home]

  def index
  end

  def show
  end

  def home
    @properties = Property.all.limit(20)
    @properties_rent = Property.where(bussiness_type: 'venda').order(:created_at).limit(8)
  end

end
