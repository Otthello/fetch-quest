require 'rails_helper'

RSpec.describe ErrandsController, type: :controller do
  let(:api){Apikey.create!(email: 'r@spec.co')}
  let(:create_errand){
    Errand.create!({
      task: "Buy snacks from target",
      lat: "41.876953",
      lng: "-87.655314",
      quest_id: 1,
      npc_id: 1,
      hero_id: 1,
      completed: 0
      })
  }
  let(:create_npc){
    Npc.create!({
      avatar_url: "http://i.imgur.com/DWTH8wm.png",
      name: "Ken the Paladin"
    })
  }
  let(:create_quest){
    Quest.create!({
      icon_url: "http://i.imgur.com/NlZj5vv.gif",
      hook: "I don't like that castle.",
      description: "Ken doesn't like that castle. Destroy it and he'll give you sweet loot"
    })
  }
  let(:errand_data){{latitude: "10.0", longitude: "15.0", task: "deposit check"}}
  describe "Post #create" do
    it "returns http success" do
      create_quest
      create_npc
      post :create, :key => "#{api.access_token}", :latitude=>"#{errand_data[:latitude]}", :longitude => "#{errand_data[:longitude]}", :task => "#{errand_data[:task]}"
      expect(response).to have_http_status(:success)
    end
  end
end
