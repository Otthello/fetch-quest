Rails.application.routes.draw do

  scope '/api' do
    scope '/v1' do
        resources :errands, :only => [:create, :index]
        post '/users', to: 'users#create'
        post '/auth', to: 'users#auth'
    end
  end
end
