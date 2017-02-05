class User < ActiveRecord::Base
  has_secure_token :auth_token

  has_many :errands, foreign_key: 'hero_id'
  has_many :equips
  has_many :quests, through: :errands

end
