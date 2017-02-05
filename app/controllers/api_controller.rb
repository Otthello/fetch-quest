class ApiController < ApplicationController
  skip_before_action :verify_access_token

  def verify_access_token
    Apikey.exists?({access_token: params[:key]})
  end
end
