class Admin::DetailsController < ApplicationController
  def create
    binding.pry
    @property = Property.find_by(id: property_param[:id])
    @landlord = Landlord.find_by(id: @property.landlord_id)
    details_actual = Detail.where(property_id: @property).map{ |detail| detail.details_type.name }
    details_updated = params[:details].select { |key, value| value == "on" }.keys
    details_actual.each do |detail|
      unless (details_updated.include? detail)
        detail_type = DetailsType.find_by(name: detail)
        Detail.where(property_id: @property, details_type_id: detail_type).destroy_all
      end
    end

    details_updated.each do |detail|
      unless (details_actual.include? detail)
        detail_type = DetailsType.find_by(name: detail)
        Detail.create(property: @property, details_type: detail_type)
      end
    end
    redirect_to details_admin_landlord_property_path(@landlord, @property)
  end

  private

  def property_param
    params.require(:property).permit(:id)
  end
  def details_params
    params.require(:details).permit!
  end
end

