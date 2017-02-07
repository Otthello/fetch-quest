class UsersController < ApiController

  def create
    if verify_access_key
      user = User.new(user_deets)
      if user.save
       render json: {token: user.auth_token}.to_json, status: :ok
      else
        render json: {error: user.errors.full_messages}.to_json, status: :bad_request
      end
    else
      render nothing: true, status: :unauthorized
    end
  end

  private

  def user_deets
    params.permit(:username, :email, :password, :avatar_url)
  end
end
