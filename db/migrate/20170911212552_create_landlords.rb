class CreateLandlords < ActiveRecord::Migration[5.0]
  def change
    create_table :landlords do |t|
      t.string :name
      t.string :rg
      t.string :cpf
      t.date :birthday
      t.string :martial_status
      t.string :profession
      t.string :phone
      t.string :email
      t.string :address
      t.string :cep
      t.boolean :deposit
      t.decimal :adm_rate
      t.decimal :first_rate
      t.string :type
      t.string :bank
      t.string :agency
      t.string :number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
