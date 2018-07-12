class AddCommentToContactForms < ActiveRecord::Migration[5.1]
  def change
    add_column :contact_forms, :message, :text
  end
end
