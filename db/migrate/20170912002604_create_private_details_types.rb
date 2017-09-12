class CreatePrivateDetailsTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :private_details_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
