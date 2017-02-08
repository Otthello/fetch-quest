class Item < ActiveRecord::Base
  has_many :equips, as: :lootable
end
