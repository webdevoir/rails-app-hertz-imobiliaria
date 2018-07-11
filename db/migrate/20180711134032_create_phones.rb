class CreatePhones < ActiveRecord::Migration[5.1]
  def change
    create_table :phones do |t|
    t.string :phone
    t.references :landlord, foreign_key: true
    end
  end
end
