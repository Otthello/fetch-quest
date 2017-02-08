class EquipsController < ApiController
  include UsersHelper
  before_action :require_login

  def index
    user = get_user
    puts user
    if user
      puts "User found"
      items = user.items

      if items
        puts "Items found"
        render json: {status: 'SUCCESS', message: 'Loaded all user equips', data: items}, status: :ok
      else
        puts "No equips"
        render nothing: true, status: :no_content
      end
    else
      puts "No user"
      render nothing: true, status: :bad_request
    end
  end

end
