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
      resources :food_categories, only: %i[index] do
        resources :foods, only: %i[index show]
      end
      resource :users_dietary_reference, only: %i[show update]
      resource :suggestion, only: %i[show]
    end
  end

  # ルーティングエラーを拾う
  get '*path', to: 'top#index'
end

# == Route Map
#
#                                       Prefix Verb   URI Pattern                                                                              Controller#Action
#                                   admin_root GET    /admin(.:format)                                                                         admin/dashboard#index
#                              admin_dashboard GET    /admin/dashboard(.:format)                                                               admin/dashboard#index
# batch_action_admin_dietary_reference_intakes POST   /admin/dietary_reference_intakes/batch_action(.:format)                                  admin/dietary_reference_intakes#batch_action
#              admin_dietary_reference_intakes GET    /admin/dietary_reference_intakes(.:format)                                               admin/dietary_reference_intakes#index
#                                              POST   /admin/dietary_reference_intakes(.:format)                                               admin/dietary_reference_intakes#create
#           new_admin_dietary_reference_intake GET    /admin/dietary_reference_intakes/new(.:format)                                           admin/dietary_reference_intakes#new
#          edit_admin_dietary_reference_intake GET    /admin/dietary_reference_intakes/:id/edit(.:format)                                      admin/dietary_reference_intakes#edit
#               admin_dietary_reference_intake GET    /admin/dietary_reference_intakes/:id(.:format)                                           admin/dietary_reference_intakes#show
#                                              PATCH  /admin/dietary_reference_intakes/:id(.:format)                                           admin/dietary_reference_intakes#update
#                                              PUT    /admin/dietary_reference_intakes/:id(.:format)                                           admin/dietary_reference_intakes#update
#           batch_action_admin_food_categories POST   /admin/food_categories/batch_action(.:format)                                            admin/food_categories#batch_action
#                        admin_food_categories GET    /admin/food_categories(.:format)                                                         admin/food_categories#index
#                                              POST   /admin/food_categories(.:format)                                                         admin/food_categories#create
#                      new_admin_food_category GET    /admin/food_categories/new(.:format)                                                     admin/food_categories#new
#                     edit_admin_food_category GET    /admin/food_categories/:id/edit(.:format)                                                admin/food_categories#edit
#                          admin_food_category GET    /admin/food_categories/:id(.:format)                                                     admin/food_categories#show
#                                              PATCH  /admin/food_categories/:id(.:format)                                                     admin/food_categories#update
#                                              PUT    /admin/food_categories/:id(.:format)                                                     admin/food_categories#update
#                     batch_action_admin_foods POST   /admin/foods/batch_action(.:format)                                                      admin/foods#batch_action
#                                  admin_foods GET    /admin/foods(.:format)                                                                   admin/foods#index
#                                              POST   /admin/foods(.:format)                                                                   admin/foods#create
#                               new_admin_food GET    /admin/foods/new(.:format)                                                               admin/foods#new
#                              edit_admin_food GET    /admin/foods/:id/edit(.:format)                                                          admin/foods#edit
#                                   admin_food GET    /admin/foods/:id(.:format)                                                               admin/foods#show
#                                              PATCH  /admin/foods/:id(.:format)                                                               admin/foods#update
#                                              PUT    /admin/foods/:id(.:format)                                                               admin/foods#update
#                     batch_action_admin_users POST   /admin/users/batch_action(.:format)                                                      admin/users#batch_action
#                                  admin_users GET    /admin/users(.:format)                                                                   admin/users#index
#                                              POST   /admin/users(.:format)                                                                   admin/users#create
#                               new_admin_user GET    /admin/users/new(.:format)                                                               admin/users#new
#                              edit_admin_user GET    /admin/users/:id/edit(.:format)                                                          admin/users#edit
#                                   admin_user GET    /admin/users/:id(.:format)                                                               admin/users#show
#                                              PATCH  /admin/users/:id(.:format)                                                               admin/users#update
#                                              PUT    /admin/users/:id(.:format)                                                               admin/users#update
#                                              DELETE /admin/users/:id(.:format)                                                               admin/users#destroy
#                               admin_comments GET    /admin/comments(.:format)                                                                admin/comments#index
#                                              POST   /admin/comments(.:format)                                                                admin/comments#create
#                                admin_comment GET    /admin/comments/:id(.:format)                                                            admin/comments#show
#                                              DELETE /admin/comments/:id(.:format)                                                            admin/comments#destroy
#                                         root GET    /                                                                                        top#index
#                          api_v1_registration POST   /api/v1/registration(.:format)                                                           api/v1/registrations#create {:format=>/json/}
#                        api_v1_authentication DELETE /api/v1/authentication(.:format)                                                         api/v1/authentications#destroy {:format=>/json/}
#                                              POST   /api/v1/authentication(.:format)                                                         api/v1/authentications#create {:format=>/json/}
#                                   api_v1_bmr GET    /api/v1/bmr(.:format)                                                                    api/v1/bmrs#show {:format=>/json/}
#                                              PATCH  /api/v1/bmr(.:format)                                                                    api/v1/bmrs#update {:format=>/json/}
#                                              PUT    /api/v1/bmr(.:format)                                                                    api/v1/bmrs#update {:format=>/json/}
#                                   api_v1_pfc GET    /api/v1/pfc(.:format)                                                                    api/v1/pfcs#show {:format=>/json/}
#                                              PATCH  /api/v1/pfc(.:format)                                                                    api/v1/pfcs#update {:format=>/json/}
#                                              PUT    /api/v1/pfc(.:format)                                                                    api/v1/pfcs#update {:format=>/json/}
#                   api_v1_food_category_foods GET    /api/v1/food_categories/:food_category_id/foods(.:format)                                api/v1/foods#index {:format=>/json/}
#                    api_v1_food_category_food GET    /api/v1/food_categories/:food_category_id/foods/:id(.:format)                            api/v1/foods#show {:format=>/json/}
#                       api_v1_food_categories GET    /api/v1/food_categories(.:format)                                                        api/v1/food_categories#index {:format=>/json/}
#               api_v1_users_dietary_reference GET    /api/v1/users_dietary_reference(.:format)                                                api/v1/users_dietary_references#show {:format=>/json/}
#                                              PATCH  /api/v1/users_dietary_reference(.:format)                                                api/v1/users_dietary_references#update {:format=>/json/}
#                                              PUT    /api/v1/users_dietary_reference(.:format)                                                api/v1/users_dietary_references#update {:format=>/json/}
#                            api_v1_suggestion GET    /api/v1/suggestion(.:format)                                                             api/v1/suggestions#show {:format=>/json/}
#                rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#                   rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#                rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#          rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#                rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#                 rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#               rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                              POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#            new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#           edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#                rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                              PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                              PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                              DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
#        rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                           rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#                    rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                           rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#                    update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                         rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
