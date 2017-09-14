class CreateValues < ActiveRecord::Migration[5.0]
  def change
    create_table :values do |t|
      t.decimal :value
      t.decimal :iptu
      t.decimal :condo_amount
      t.decimal :rate
      t.references :property, foreign_key: true


      t.timestamps
    end
  end
end
