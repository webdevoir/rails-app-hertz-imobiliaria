class CreateExteriorDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :exterior_details do |t|
      t.references :property, foreign_key: true
      t.references :exterior_details_type, foreign_key: true

      t.timestamps
    end
  end
end
