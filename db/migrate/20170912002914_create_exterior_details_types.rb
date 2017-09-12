class CreateExteriorDetailsTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :exterior_details_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
