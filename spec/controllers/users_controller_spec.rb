require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    let(:api){Apikey.create!(email: 'r@spec.co')}

  describe "GET #create" do
    let(:user_data){{email: "imanemail@mail.com", username: "banana", avatar_url: "bananagram.jpg"}}
    it "returns http success" do
      post :create, :key => "#{api.access_token}", :username=>"#{user_data[:username]}", :email => "#{user_data[:email]}", :avatar_url => "#{user_data[:avatar_url]}"
      expect(response).to have_http_status(:success)
    end

    it "returns a json auth_token" do
      post :create, :key => "#{api.access_token}", :username=>"#{user_data[:username]}", :email => "#{user_data[:email]}", :avatar_url => "#{user_data[:avatar_url]}"
      jsonResponse = {user_token: User.last.auth_token}.to_json
      # puts response.body
      expect(response.content_type).to eq("application/json")
      expect(response.body).to eq(jsonResponse)
    end


  end

end
