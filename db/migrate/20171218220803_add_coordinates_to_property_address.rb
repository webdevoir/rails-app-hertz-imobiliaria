class AddCoordinatesToPropertyAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :property_addresses, :latitude, :float
    add_column :property_addresses, :longitude, :float
  end
end
