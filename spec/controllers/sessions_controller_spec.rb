require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:test_env){TestSeeder.new}
  let(:user_data){{email: "imanemail@mail.com", password: "password", username: "testerhino", avatar_url: "http://pictureofbanana.com/spider.png"}}

  describe "Sessions#create" do
    before(:each){test_env.run_all}
    before(:each){User.create!(user_data)}

    it "returns http success when accompanied with apikey" do
      keyed_user_data = {password: user_data[:password], email: user_data[:email]}
      keyed_user_data[:key] = test_env.key
      post :create, keyed_user_data
      expect(response).to have_http_status(:success)
    end

    it "returns unauth without key" do
      unkeyed_user_data = {password: user_data[:password], email: user_data[:email]}
      post :create, unkeyed_user_data
      expect(response).to have_http_status(:unauthorized)
    end

    it "returns a token on successful login" do
      keyed_user_data = {password: user_data[:password], email: user_data[:email]}
      keyed_user_data[:key] = test_env.key
      jsonResponse = {data: {token: User.last.auth_token}}.to_json
      post :create, keyed_user_data
      expect(response.content_type).to eq("application/json")
      expect(JSON.parse(response.body)[:data]).to equal(JSON.parse(jsonResponse)[:data])
    end

    it "return bad request when no password match is found" do
      keyed_user_data = {password: "123123413472354234134724512351346", email: user_data[:email]}
      keyed_user_data[:key] = test_env.key
      post :create, keyed_user_data
      expect(response).to have_http_status(:bad_request)
    end

    it "return bad request when no email match is found" do
      keyed_user_data = {password: "password", email: "12365124361234762354723458354683456834568"}
      keyed_user_data[:key] = test_env.key
      post :create, keyed_user_data
      expect(response).to have_http_status(:bad_request)
    end
  end

  #LOGOUT IS HANDLED CLIENT SIDE
  # describe "Sessions#logout" do
  #   before(:each){test_env.run_all}

  #   it "returns http success when accompanied with apikey and token" do
  #     user = User.find(test_env.user_id)
  #     keyed_and_tokened_data = {token: user.auth_token, key: test_env.key}
  #     post :destroy, keyed_and_tokened_data
  #     expect(response).to have_http_status(:success)
  #   end

  #   it "returns unauth without key" do
  #     user = User.find(test_env.user_id)
  #     unkeyed_data = {token: user.auth_token}
  #     post :destroy, unkeyed_data
  #     expect(response).to have_http_status(:unauthorized)
  #   end

  #   it "returns unauth without token" do
  #     untokened_user_data = {key: test_env.key}
  #     post :destroy, untokened_user_data
  #     expect(response).to have_http_status(:unauthorized)
  #   end

  #   it "invalidates the user token on success" do
  #     user = User.find(test_env.user_id)
  #     before_token = user.auth_token
  #     keyed_and_tokened_data = {token: before_token, key: test_env.key}
  #     post :destroy, keyed_and_tokened_data
  #     after_user = User.find(test_env.user_id)
  #     expect(after_user.auth_token).not_to eq(before_token)
  #   end
  # end


end
