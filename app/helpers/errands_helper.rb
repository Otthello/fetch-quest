module ErrandsHelper
  def get_user
    User.find_by(auth_token: params[:auth_token])
  end
end
