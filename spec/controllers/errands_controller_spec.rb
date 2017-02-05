require 'rails_helper'

RSpec.describe ErrandsController, type: :controller do


#////////////////////////////////////////
  let(:api){Apikey.create!(email: 'r@spec.co')}
  let(:user) { User.create!(
                username: "MojoJojo",
                email: "jank@lank.com",
                password: "asdf",
                avatar_url: "http://www.website.com")
              }
  let (:errand_information) {Errand.create!(
                  task: "knee",
                  lat: "5",
                  lng: "6",
                  quest_id: 1,
                  npc_id: 1,
                  completed: 0)
                }

  describe 'GET #index' do
    it "returns success for get request" do
      user.errands.create!(errand_information)

      get :index, key: "#{api.access_token}", email: "#{user.email}", password: "#{user.password}"
      expect(response).to have_http_status(:success)
    end

    it "returns errands for authenticated user" do
      get :index, key: "#{api.access_token}", email: "#{user.email}", password: "#{user.password}"
      jsonResponse = { errands: user.errands }.to_json

      expect(response.body).to eq(jsonResponse)
    end
  end
#//////////////////////////////////////////////////////////



end
