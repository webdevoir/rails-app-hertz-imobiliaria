class CreateDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :details do |t|
      t.references :property, foreign_key: true
      t.references :details_type, foreign_key: true

      t.timestamps
    end
  end
end
