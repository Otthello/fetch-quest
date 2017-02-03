class CreateNpcs < ActiveRecord::Migration
  def change
    create_table :npcs do |t|
      t.string :avatar_url
      t.string :name

      t.timestamps null: false
    end
    add_index(:npcs, :avatar_url)
    add_index(:npcs, :name)
  end
end
