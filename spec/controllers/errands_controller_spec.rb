require 'rails_helper'

RSpec.describe ErrandsController, type: :controller do
  let(:user) { User.create!(
                username: "MojoJojo",
                email: "jank@lank.com",
                avatar_url: "http://www.website.com")
              }
  let (:errand) {Errand.create!(
                  task: "knee",
                  lat: "5",
                  lng: "6",
                  quest_id: 1,
                  hero_id: 1,
                  npc_id: 1,
                  completed: 0)
                }
  let (:errands) { User.first.errands }

  describe 'GET #index' do
    it "returns success for get request" do
      user.errands << errand
      get :index#, user: :user, errand: :errand
      expect(response).to have_http_status(:success)
    end

    it "returns errands for authenticated user" do

      get :index
      jsonResponse = { errands: errands }.to_json
      expect(response).to eq(jsonResponse)
    end
  end
end
