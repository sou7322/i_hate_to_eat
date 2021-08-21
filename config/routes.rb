Rails.application.routes.draw do
  root to: 'top#index'

  namespace :api, format: 'json' do
    namespace :v1 do
      resource :registration, only: [:create]
    end
  end
end
