class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.references :landlord, foreign_key: true
      t.integer :code
      t.string :bussiness_type
      t.string :property_type
      t.string :property_kind
      t.string :property_state
      t.string :position
      t.string :style
      t.integer :construction_year
      t.integer :bathrooms
      t.integer :rooms
      t.integer :garages
      t.integer :suites
      t.text :description
      t.boolean :published, default: false
      t.text :conditions

      t.timestamps
    end
  end
end
