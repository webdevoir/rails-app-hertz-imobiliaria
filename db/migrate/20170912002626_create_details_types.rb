class CreateDetailsTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :details_types do |t|
      t.string :type
      t.string :name
      t.timestamps
    end
  end
end
