class Errand < ActiveRecord::Base
  belongs_to :hero, class_name: 'User'
  belongs_to :npc
  belongs_to :quest

  validates :completed, inclusion: {in: [0,1]}

end
