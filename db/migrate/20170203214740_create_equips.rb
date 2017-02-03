class CreateEquips < ActiveRecord::Migration
  def change
    create_table :equips do |t|
      t.integer :owner_id
      t.integer :lootable_id
      t.string :lootable_type

      t.timestamps null: false
    end
    add_index(:equips, [:lootable_type, :lootable_id])
  end
end
