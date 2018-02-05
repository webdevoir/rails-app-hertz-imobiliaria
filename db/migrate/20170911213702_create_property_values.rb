class CreatePropertyValues < ActiveRecord::Migration[5.0]
  def change
    create_table :property_values do |t|
      t.decimal :rent
      t.decimal :sell
      t.decimal :iptu
      t.decimal :condominium
      t.references :property, foreign_key: true
      t.timestamps
    end
  end
end
