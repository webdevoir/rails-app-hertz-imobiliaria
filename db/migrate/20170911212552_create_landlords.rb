class CreateLandlords < ActiveRecord::Migration[5.0]
  def change
    create_table :landlords do |t|
      t.string :name
      t.string :rg
      t.string :cpf
      t.date :birthday
      t.string :martial_status
      t.string :profession
      t.string :phone1
      t.string :phone2
      t.string :email
      t.string :cep
      t.string :country
      t.string :state
      t.string :city
      t.string :neighborhood
      t.string :street
      t.string :number
      t.string :complement
      t.string :condo_name
      t.boolean :deposit
      t.decimal :adm_rate
      t.decimal :first_rate
      t.string :type_of_account
      t.string :bank
      t.string :agency
      t.string :number
      t.timestamps
    end
  end
end
