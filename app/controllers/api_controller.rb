class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def verify_authenticity_token
    Apikey.exists?({auth_token: params[:key]})
  end
end
