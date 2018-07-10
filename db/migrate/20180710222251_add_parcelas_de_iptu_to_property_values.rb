class AddParcelasDeIptuToPropertyValues < ActiveRecord::Migration[5.1]
  def change
    add_column :property_values, :installments, :boolean
    add_column :property_values, :number_of_installments, :integer
  end
end
