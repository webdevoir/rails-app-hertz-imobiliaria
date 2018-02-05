class CreateLandlords < ActiveRecord::Migration[5.0]
  def change
    create_table :landlords do |t|
      t.string :name,           default: ""
      t.string :rg,             default: ""
      t.string :cpf,            default: ""
      t.date :birthday,         default: ""
      t.string :martial_status, default: ""
      t.string :profession,     default: ""
      t.string :phone1,         default: ""
      t.string :phone2,         default: ""
      t.string :email,          default: ""
      t.string :cep,            default: ""
      t.string :country,        default: "BR"
      t.string :state,          default: ""
      t.string :city,           default: ""
      t.string :neighborhood,   default: ""
      t.string :street,         default: ""
      t.string :number,         default: ""
      t.string :complement,     default: ""
      t.string :condo_name,     default: ""
      t.boolean :deposit,       default: false
      t.decimal :adm_rate,      default: 0
      t.decimal :first_rate,    default: 0
      t.string :type_of_account,default: ""
      t.string :bank,           default: ""
      t.string :agency,         default: ""
      t.string :number,         default: ""
      t.timestamps
    end
  end
end
