Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :manufacturers do
        resources :bikes, only: %i[index]
      end
    end
  end
end
