class CreateEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :emails do |t|
      t.string :email
      t.references :landlord, foreign_key: true
    end
  end
end
