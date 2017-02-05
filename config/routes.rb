Rails.application.routes.draw do
  scope '/api' do
    scope '/v1' do
      get '/hello' => 'tests#hello'
      scope '/test' do
        resources :errands, :only => [:create, :index]
      end
    end
  end
end
