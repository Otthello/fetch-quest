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
end
