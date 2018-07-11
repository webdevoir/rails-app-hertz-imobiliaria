class CreateBusinessTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :business_types do |t|
      t.string :name
    end
  end
end
