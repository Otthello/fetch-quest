class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :slot
      t.integer :rarity
      t.string :image_url
      t.string :description
      t.string :name

      t.timestamps null: false
    end
  end
end
