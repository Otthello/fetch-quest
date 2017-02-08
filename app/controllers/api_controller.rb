class ApiController < ApplicationController
  before_action :verify_access_key

  def verify_access_key
    puts "/" * 60
    puts [" " * 15, "Checking Access Key".upcase].join('')
    puts "/" * 60
    Apikey.exists?({access_token: params[:key]})
  end

  def require_login
    authenticate_token || render_unauthorized("Access Denied")
  end

  def current_user
   @current_user ||= authenticate_token
  end

  def render_unauthorized(message)
    errors ={errors: [{detail: message}]}
    render json: errors, status: :unauthorized
  end

  private

  #necessary during early stages of development
  def cors_header_check
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  def authenticate_token
    puts "/" * 60
    puts [" " * 15,"authenticating user token".upcase].join('')
    puts "/" * 60
    token = params[:token]
      if user = User.with_unexpired_token(token, 2.days.ago)
        ActiveSupport::SecurityUtils.secure_compare(
                        ::Digest::SHA256.hexdigest(token),
                        ::Digest::SHA256.hexdigest(user.auth_token))
      end
  end

end
