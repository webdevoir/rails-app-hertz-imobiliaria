class CreateBankAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :bank_accounts do |t|
      t.string :type
      t.string :bank
      t.string :agency
      t.string :number

      t.timestamps
    end
  end
end
