class CreateInteriorDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :interior_details do |t|
      t.references :property, foreign_key: true
      t.references :interior_details_type, foreign_key: true

      t.timestamps
    end
  end
end
