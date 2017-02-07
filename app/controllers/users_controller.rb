class UsersController < ApiController
  def create
    p user_deets
    user = User.new(user_deets)
    p user
    if user.save
      p "User Saved"
     render json: {token: user.auth_token}.to_json, status: :ok
    else
      p "Bad request"
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
