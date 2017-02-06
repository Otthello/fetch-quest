class User < ActiveRecord::Base
  has_many :errands, foreign_key: 'hero_id'
  has_many :equips
  has_many :quests, through: :errands

 has_secure_password
 has_secure_token :auth_token
 after_validation :date_that_token

  def date_that_token
    self.token_created_at = Time.now
  end

  def invalidate_token
    self.update_columns(auth_token: nil)
  end

  def token
    self.auth_token
  end

  def token=(new_token)
    self.auth_token = new_token
    put "we're making a new auth token with the jank way"
  end

  def self.with_unexpired_token(token, period)
    User.where(auth_token: token).where('token_created_at >= ?', period).first
  end

  def logout
    invalidate_token
  end

  def incompleted_errand_locations
    self.errands.where(completed: 0).collect{|errand| {lat: errand.lat, lng: errand.lng, hook: errand.quest.hook, npc_thumb: errand.npc.avatar_url}}
  end

  def errands_and_quests
    self.errands.collect do |errand|
       quest = errand.quest
       npc = errand.npc
       data = {
        task: errand.task,
        completed: errand.completed,
        updated_at: errand.updated_at,
        quest_description: quest.description,
        npc_avatar_url: npc.avatar_url,
        npc_name: npc.name
      }
    end
  end
end
