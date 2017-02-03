class CreateErrands < ActiveRecord::Migration
  def change
    create_table :errands do |t|
      t.string :task, null: false
      t.string :lat, null: false
      t.string :lng, null: false
      t.integer :quest_id, null: false
      t.integer :hero_id, null: false
      t.integer :npc_id, null: false
      t.integer :completed, null: false

      t.timestamps null: false
    end
    add_index(:errands, :lat)
    add_index(:errands, :lng)
  end
end
