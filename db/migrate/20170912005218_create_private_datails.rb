class CreatePrivateDatails < ActiveRecord::Migration[5.0]
  def change
    create_table :private_datails do |t|
      t.references :property, foreign_key: true
      t.references :private_details_type, foreign_key: true

      t.timestamps
    end
  end
end
