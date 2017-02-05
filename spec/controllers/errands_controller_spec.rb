require 'rails_helper'

RSpec.describe ErrandsController, type: :controller do
  let (:errands) { User.first.errands }

  describe 'GET #index' do
    it "returns errands for authenticated user" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
