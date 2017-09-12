class CreatePropertyAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :property_areas do |t|
      t.string :scale
      t.float :total_area
      t.float :usable_area
      t.float :area_land
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
