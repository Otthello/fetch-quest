class EquipController < ApplicationController
  include UsersHelper

  before_action :require_login

  def index
    user = get_user
    if !!user
      p "user found"
      equips = user.equips
      if !!equips
        p equips
        p '/' * 40
        render json: {status: 'SUCCESS', message: 'Loaded all errands and locations', data: equips}, status: :ok}
      else
        p "no equips"
        render nothing: true, status: :bad_request
      end
    else
      p "No user"
      render nothing: true, status: :bad_request
    end
  end

end
