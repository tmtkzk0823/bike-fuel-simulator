Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :manufacturers, only: %i[index]
    end
  end
end
