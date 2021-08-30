Rails.application.routes.draw do
  root to: 'top#index'

  namespace :api, format: 'json' do
    namespace :v1 do
      resource :registration, only: %i[create]
      resource :authentication, only: %i[create destroy]
      resources :home, only: %i[index]
    end
  end
end
