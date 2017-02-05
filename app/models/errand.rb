class Errand < ActiveRecord::Base
  belongs_to :user, foreign_key: :hero_id
  belongs_to :npc
  belongs_to :quest
end
