class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.references :landlord, foreign_key: true
      t.boolean :sale, default: false
      t.boolean :rent, default: false
      t.string :property_genre
      t.string :property_type
      t.string :property_condition
      t.string :position
      t.string :style
      t.datetime :construction_year
      t.integer :bathrooms
      t.integer :rooms
      t.integer :garages
      t.integer :suites
      t.text :description
      t.text :conditions_business
      t.text :observations
      t.boolean :published, default: true
      t.timestamps
    end
  end
end
