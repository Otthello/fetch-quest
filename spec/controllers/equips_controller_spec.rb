require 'rails_helper'

RSpec.describe EquipsController, type: :controller do
  describe "Equip#index" do
    let(:test_env){TestSeeder.new}
    it "returns all of a users inventory" do
      test_env.run_all
      get :index, key: test_env.key, token: test_env.token
      jsonResponse = {data: Item.where(id: test_env.item_id)}.to_json
      expect(JSON.parse(response.body).fetch("data")).to eq(JSON.parse(jsonResponse).fetch("data"))
    end
  end
end
