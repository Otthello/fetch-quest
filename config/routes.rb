Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  scope '/api' do
    scope '/v1' do
      scope :format => true, :constraints => { :format => 'json' } do
        post   "/login"       => "sessions#create"
        delete "/logout"      => "sessions#destroy"
      end
      get '/hello' => 'tests#hello'
      scope '/test' do
        resources :errands, :only => [:create, :index]
      end
    end
  end
end
