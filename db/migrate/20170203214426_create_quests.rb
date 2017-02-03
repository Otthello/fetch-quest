class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :hook
      t.text :description
      t.string :icon_url

      t.timestamps null: false
    end
    add_index(:quests, :hook)
    add_index(:quests, :icon_url)
  end
end
