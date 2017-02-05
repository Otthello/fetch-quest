Rails.application.routes.draw do

  scope '/api' do
    scope '/v1' do
      resources :errands, :except => [:show, :destroy, :new, :edit]
      scope :format => true, :constraints => { :format => 'json' } do
        post   "/login"       => "sessions#create"
        delete "/logout"      => "sessions#destroy"
      end

    end
  end
end
