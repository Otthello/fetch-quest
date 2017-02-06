class SessionsController < ApiController
  skip_before_action :require_login, only: [:create], raise: false

  def create
    p "Finding User---------------------"
    user = User.find_by(email: params[:email])
    p "Printing user--------------------"
    p user
    p "Printing params-----------------"
    p params
    if user == nil
      render_unauthorized("Error with your login or password")
    elsif user.authenticate(params[:password])
      puts 'User found'
      send_auth_token_for_valid_login_of(user)
    else
      render_unauthorized("Error with your login or password")
    end
  end

  def destroy
    logout
    render nothing: true, status: :ok
  end

  private

  def send_auth_token_for_valid_login_of(user)
    render json: { token: user.token }
  end

  def logout
    current_user.invalidate_token
  end

  #Potential future implementation
  def allow_token_to_be_used_only_once_for(user)
    user.regenerate_token
  end
end
