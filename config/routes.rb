Rails.application.routes.draw do
  get 'users/create'

  scope '/api' do
    scope '/v1' do
        resources :errands, :only => [:create, :index]
        post '/users', to: 'users#create'
    end
  end
end
