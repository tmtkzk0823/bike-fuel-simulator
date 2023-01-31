Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api do
    namespace :v1 do
      namespace :auth do
        resources :sessions, only: %i[index]
      end

      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations'
      }

      resources :manufacturers do
        resources :bikes, only: %i[index] 
      end

      resource :user_bikes, only: %i[ create destroy ]
      get '/user_have_bikes', to: 'user_bikes#user_have_bikes'
    end
  end
end
