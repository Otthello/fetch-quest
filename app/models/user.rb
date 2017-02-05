class User < ActiveRecord::Base
 has_secure_password
 has_secure_token :auth_token

  def invalidate_token
    self.update_columns(token: nil)
  end

  def self.valid_login?(email, password)
    user = find_by(email: email)
    if user && user.authenticate(password)
      user
    end
  end
  def with_unexpired_token(token, period)
    where(token: token).where('token_created_at >= ?', period).first
  end
  def logout
    invalidate_token
  end
end
