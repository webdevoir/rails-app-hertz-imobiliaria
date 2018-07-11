class DeleteBusinessTypesAndPropertyTypeFromProperty < ActiveRecord::Migration[5.1]
  def change
    remove_column :properties, :bussiness_type, :string
    remove_column :properties, :property_type, :string
    add_reference :properties, :business_type, index: true
    add_reference :properties, :property_type, index: true
  end
end
