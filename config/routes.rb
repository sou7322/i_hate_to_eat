Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root to: 'top#index'

  namespace :api, format: 'json' do
    namespace :v1 do
      resource :registration, only: %i[create]
      resource :authentication, only: %i[create destroy]
      resource :home, only: %i[index]
      resource :bmr, only: %i[show update]
      resource :pfc, only: %i[show update]
      resource :users_dietary_reference, only: %i[show update]
    end
  end
end
