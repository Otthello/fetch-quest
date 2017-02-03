class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :avatar_url, null: false
      t.string :password_digest

      t.timestamps null: false
    end
    add_index(:users,:email)
  end
end
