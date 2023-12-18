class AddConfirmableToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :confirmation_token, :string
    add_column :users, :email_confirmed, :boolean
    add_index :users, :email_confirmed
  end
end
