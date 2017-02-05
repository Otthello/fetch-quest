class AddAuthTokenToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :password_digest
    add_column :users, :auth_token, :string
  end
end
