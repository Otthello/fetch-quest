class UsersController < ApiController
  def create
    user = User.new(user_deets)
    if user.save
     render json: {token: user.auth_token}.to_json, status: :ok
    else
      render json: {error: user.errors.full_messages}.to_json, status: :bad_request
    end
  end

  # def auth
  #   user = User.find_by(email: params[:email])
  #   # p user
  #   if user
  #    render json: {user_token: user.auth_token}.to_json, status: :ok
  #   else
  #     render nothing: true, status: :bad_request
  #   end
  # end
  private
  def user_deets
    # p params
    params.permit(:username, :email, :password, :avatar_url)
  end
end
