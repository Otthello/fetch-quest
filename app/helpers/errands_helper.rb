module ErrandsHelper
  def get_user_errands
    current_user.errands
  end
end
