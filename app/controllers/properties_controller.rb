class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index]
  layout 'landing-page', only: [:home]

  def index
  end

  def home
    @propeties = Property.all
  end

end
