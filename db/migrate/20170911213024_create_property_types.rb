class CreatePropertyTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :property_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
