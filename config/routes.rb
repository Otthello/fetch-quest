Rails.application.routes.draw do

  scope '/api' do
    scope '/v1' do
      resources :errands, :except => [:show, :destroy, :new, :edit]
        post   "/login"       => "sessions#create", :constraints => { :format => 'json' }
        delete "/logout"      => "sessions#destroy", :constraints => { :format => 'json' }
    end
  end
  get '/test', to: 'test#hello'

end
