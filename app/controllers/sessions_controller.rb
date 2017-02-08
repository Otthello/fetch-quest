class SessionsController < ApiController
  skip_before_action :require_login, only: [:create], raise: false

  def create
    if verify_access_key
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        puts 'User found'
        send_auth_token_for_valid_login_of(user)
      else
        render nothing: true, status: :bad_request, msg:"Error with your login or password"
      end
    else
      render nothing: true, status: :unauthorized
    end
  end

  def destroy
    logout
    render nothing: true, status: :ok
  end

  private

  def send_auth_token_for_valid_login_of(user)
    if user.regenerate_token
      render json: { token: user.auth_token }
    else
      render nothing: true, status: :internal_server_error, msg: "Error with user credentials"
    end
  end

  def logout
    current_user.invalidate_token
  end
end
