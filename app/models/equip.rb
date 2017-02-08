class Equip < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  belongs_to :lootable, polymorphic: true
end
