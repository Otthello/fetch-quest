require 'rails_helper'

RSpec.describe ErrandsController, type: :controller do
  let(:test_env){TestSeeder.new}

  describe 'GET #index aka request user errands' do

    it "returns success for get request with a proper key and token" do
      test_env.run_all
      get :index, key: "#{test_env.key}", token: "#{test_env.token}"
      expect(response).to have_http_status(:success)
    end

    it "returns bad request for get request without credentials" do
      get :index
      expect(response).to have_http_status(:unauthorized)
    end

    it "returns quests and errands for authenticated user" do
      test_env.run_all
      user = User.find(test_env.user_id)
      jsonResponse = { data: user.errands_and_quests }.to_json

      get :index, key: "#{test_env.key}", token: "#{test_env.token}"
      expect(response.content_type).to eq("application/json")

      expect(JSON.parse(response.body).fetch("data")).to eq(JSON.parse(jsonResponse).fetch("data"))
    end

    it "returns location and snippets with options location" do
      test_env.run_all
      user = User.find(test_env.user_id)
      snippet = user.errands.collect{|errand| {hook: errand.quest.hook, npc_thumb: errand.npc.avatar_url, lat: errand.lat, lng: errand.lng, id: errand.id}}
      jsonResponse = { data: snippet }.to_json

      get :index, key: "#{test_env.key}", token: "#{test_env.token}", options: "location"
      expect(response.content_type).to eq("application/json")
      expect(JSON.parse(response.body).fetch("data")).to eq(JSON.parse(jsonResponse).fetch("data"))
    end

  end

  describe "PUT errands#update aka request errand completion" do

    it "returns status ok" do
      test_env.run_all
      put :update, key: "#{test_env.key}", token: "#{test_env.token}", id: "#{test_env.errand_id}"
      expect(response).to have_http_status(:success)
    end

    it "refuses changes from unauthorized users" do
      test_env.run_all
      put :update, key: "#{test_env.key}", id: "#{test_env.errand_id}"
      expect(response).to have_http_status(:unauthorized)
    end

    it "changes the complete attribute" do
      test_env.run_all
      before_put = Errand.find(test_env.errand_id).completed
      put :update, key: "#{test_env.key}", token: "#{test_env.token}", :id => "#{test_env.errand_id}"
      errand = Errand.find(test_env.errand_id)
      expect(errand.completed).not_to eq(before_put)
    end
  end


  describe "Post #create aka store new errand" do
    # let(:test_env){test_seeder.new}
    let(:errand_data){{latitude: "10.0", longitude: "15.0", task: "deposit check"}}

    it "returns http success" do
      test_env.run_all
      user = User.last
      post :create, key: "#{test_env.key}", token: "#{test_env.token}", :latitude=>"#{errand_data[:latitude]}", :longitude => "#{errand_data[:longitude]}", :task => "#{errand_data[:task]}"
      expect(response).to have_http_status(:success)
    end

    it "refuses to add a new errand without a token" do
      test_env.run_all
      post :create, :key => "#{test_env.key}", :latitude=>"#{errand_data[:latitude]}", :longitude => "#{errand_data[:longitude]}", :task => "#{errand_data[:task]}"
      expect(response).to have_http_status(:unauthorized)
    end

    it "stores the new errand" do
      test_env.run_all
      user = User.last
      post :create, key: "#{test_env.key}", token: "#{test_env.token}", :latitude=>"#{errand_data[:latitude]}", :longitude => "#{errand_data[:longitude]}", :task => "#{errand_data[:task]}"
      errand = Errand.last

      expect(errand.lat).to eq(errand_data[:latitude])
      expect(errand.lng).to eq(errand_data[:longitude])
      expect(errand.task).to eq(errand_data[:task])
      expect(errand.hero_id).to eq(user.id)
    end
  end

end
