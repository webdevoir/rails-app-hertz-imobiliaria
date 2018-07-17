class RemovePhonesAndEmailFromLandlord < ActiveRecord::Migration[5.1]
  def change
    remove_columns :landlords, :phone1, :phone2, :email
  end
end
