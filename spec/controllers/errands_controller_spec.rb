require 'rails_helper'

RSpec.describe ErrandsController, type: :controller do
  let(:api){Apikey.create!(email: 'r@spec.co')}
  describe "put errands#update" do
    it "returns status ok" do
    user_info = {
      email: "imanemail@mail.com",
      username: "banana",
      avatar_url: "bananagram.jpg"
    }
    User.create(user_info)
    errand_info = {
      task: "Buy snacks from target",
      lat: "41.876953",
      lng: "-87.655314",
      quest_id: 1,
      npc_id: 1,
      hero_id: 1,
      completed: 0
    }
    errand = Errand.create!(errand_info)

    put :update, :key => "#{api.access_token}", :id => "#{errand.id}"
    expect(response).to have_http_status(:success)

    end

    it "changes the complete attribute" do
          user_info = {
      email: "imanemail@mail.com",
      username: "banana",
      avatar_url: "bananagram.jpg"
    }
    User.create(user_info)
    errand_info = {
      task: "Buy snacks from target",
      lat: "41.876953",
      lng: "-87.655314",
      quest_id: 1,
      npc_id: 1,
      hero_id: 1,
      completed: 0
    }
    errand = Errand.create!(errand_info)
    before_put = errand.completed
    # puts errand_completed
    put :update, :key => "#{api.access_token}", :id => "#{errand.id}"
    errand = Errand.find(errand.id)
    expect(errand.completed).not_to eq(before_put)
    end
  end
end
