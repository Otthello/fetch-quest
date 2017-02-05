module UsersHelper
  def get_user
    User.find_by(auth_token: params[:key])
  end
end
