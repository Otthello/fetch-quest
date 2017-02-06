class ApiController < ApplicationController
  skip_before_action :verify_access_token
  # before_filter :cors_header_check

  def verify_access_token
    Apikey.exists?({access_token: params[:key]})
  end

  def require_login
    authenticate_token || render_unauthorized("Access Denied")
  end

  def current_user
   @current_user ||= authenticate_token
  end

  protected

  def render_unauthorized(message)
    errors ={errors: [{detail: message}]}
    render json: errors, status: :unauthorized
  end

  private

  def cors_header_check
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      if user = User.with_unexpired_token(token, 2.days.ago)
        ActiveSupport::SecurityUtils.secure_compare(
                        ::Digest::SHA256.hexdigest(token),
                        ::Digest::SHA256.hexdigest(user.token))
        user
      end
    end

  end
end
