class Admin::DetailsController < ApplicationController
  def create
    @property = Property.find_by(id: property_param[:id])
    @landlord = Landlord.find_by(id: @property.landlord_id)
    @new_property_details = details_params.keys
    @all_details = DetailsType.all
    @actual_property_details = Detail.where(property_id: @property).map{ |detail| detail.details_type.name }
    #binding.pry
    @new_property_details.each do |detail|
      detail_in_db = @all_details.find_by(name: detail)
      if detail_in_db.nil?
        new_detail = DetailsType.create(name: detail)
        Detail.create(property_id: @property.id, details_type_id: new_detail.id)
      elsif !@actual_property_details.include?(detail)
        Detail.create(property_id: @property.id, details_type_id: DetailsType.find_by(name: detail).id)
      end
    end
    @actual_property_details.select{|detail| !@new_property_details.include?(detail)}.each do |detail|
      detail_to_delete = DetailsType.find_by(name: detail)
      Detail.where(details_type_id: detail_to_delete).delete_all
    end

    redirect_to details_admin_landlord_property_path(@landlord, @property)

  #   details_updated = params[:details].select { |key, value| value == "on" }.keys
  #   details_actual.each do |detail|
  #     unless (details_updated.include? detail)
  #       detail_type = DetailsType.find_by(name: detail)
  #       Detail.where(property_id: @property, details_type_id: detail_type).destroy_all
  #     end
  #   end

  #   details_updated.each do |detail|
  #     unless (details_actual.include? detail)
  #       detail_type = DetailsType.find_by(name: detail)
  #       Detail.create(property: @property, details_type: detail_type)
  #     end
  #   end
  #   redirect_to details_admin_landlord_property_path(@landlord, @property)
  end

  private

  def property_param
    params.require(:property).permit(:id)
  end
  def details_params
    unless params[:details].nil?
      params.require(:details).permit!
    else
      {}
    end
  end
end

