class CreatePropertyAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :property_addresses do |t|
      t.string :cep
      t.string :country
      t.string :state
      t.string :city
      t.string :neighborhood
      t.string :street
      t.string :number
      t.string :complement
      t.string :condo_name
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
