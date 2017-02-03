Rails.application.routes.draw do
  scope '/api' do
    scope '/v1' do
      get '/hello' => 'tests#hello'
    end
  end
end
