class CreateContactForms < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_forms do |t|
      t.string :name
      t.string :telefone
      t.string :email
      t.references :property, foreign_key: true
      t.timestamps
    end
  end
end
