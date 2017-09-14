class Admin::PropertiesController < ApplicationController

  def new
    @property = Property.new
  end

end
