Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "welcome#index"
  namespace :api do
    namespace :v1 do
      resources :states, only: %i[index show] do
        resources :resources, only: %i[index]
      end
    end
  end
end
