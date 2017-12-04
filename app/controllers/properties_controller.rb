class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  layout 'landing-page', only: [:home]

  def index
  end

  def show
  end

  def home
    @properties = Property.all
  end

end
