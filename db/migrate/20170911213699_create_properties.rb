class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.references :landlord, foreign_key: true
      t.boolean :sale, default: false
      t.boolean :rent, default: false
      t.string :bussiness_type, default: ""
      t.string :property_type, default: ""
      t.string :condition, default: ""
      t.string :position, default: ""
      t.string :style, default: ""
      t.integer :construction_year, default: ""
      t.integer :bathrooms, default: 0
      t.integer :rooms, default: 0
      t.integer :garages, default: 0
      t.integer :suites, default: 0
      t.text :description, default: ""
      t.text :sell_conditions, default: ""
      t.text :rent_guarantee, default: ""
      t.text :observations, default: ""
      t.boolean :published, default: true
      t.boolean :featured, default: false
      t.timestamps
    end
  end
end
