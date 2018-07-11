class AddAccountNumberToLandlords < ActiveRecord::Migration[5.1]
  def change
    add_column :landlords, :account_number, :string
  end
end
