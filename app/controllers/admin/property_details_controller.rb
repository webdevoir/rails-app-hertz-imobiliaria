class Admin::PropertyDetailsController < ApplicationController

  def create
    @property = Property.find_by(id: property_param[:id])
    @new_property_details = details_params.keys
    @all_details = DetailsType.all
    @actual_property_details = PropertyDetail.where(property_id: @property).map{ |detail| detail.details_type.name }
    @new_property_details.each do |detail|
      detail_in_db = @all_details.find_by(name: detail)
      if detail_in_db.nil?
        new_detail = DetailsType.create(name: detail)
        PropertyDetail.create(property_id: @property.id, details_type_id: new_detail.id)
      elsif !@actual_property_details.include?(detail)
        PropertyDetail.create(property_id: @property.id, details_type_id: DetailsType.find_by(name: detail).id)
      end
    end
    @actual_property_details.select{|detail| !@new_property_details.include?(detail)}.each do |detail|
      detail_to_delete = DetailsType.find_by(name: detail)
      PropertyDetail.where(details_type_id: detail_to_delete).delete_all
    end

    redirect_to area_admin_property_path(@property)
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

