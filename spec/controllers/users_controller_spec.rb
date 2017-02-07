require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    let(:test_env){TestSeeder.new}
    let(:user_data){{email: "imanemail@mail.com", username: "banana", password: "password", avatar_url: "http://www.imgur.com/bananagram.jpg"}}

  describe "Post #create" do
    before(:each){test_env.run_all}
    it "returns http success" do
      keyed_user_data = user_data
      keyed_user_data[:key] = test_env.key
      post :create, keyed_user_data
      expect(response).to have_http_status(:success)
    end

    it "returns a json auth_token" do
      keyed_user_data = user_data
      keyed_user_data[:key] = test_env.key
      post :create, keyed_user_data
      user = User.find(test_env.user_id)
      jsonResponse = {user_token: user.auth_token}.to_json
      expect(response.content_type).to eq("application/json")
      expect(response.body).to eq(jsonResponse)
    end

    it "returns http unauthorized without api key" do
      post :create, user_data
      expect(response).to have_http_status(:unauthorized)
    end

    it "stores a new user in the database" do
      before_count = User.count
      keyed_user_data = user_data
      keyed_user_data[:key] = test_env.key
      post :create, keyed_user_data
      after_count = User.count
      expect(before_count).to be_less_than(after_count)
    end
  end
end
