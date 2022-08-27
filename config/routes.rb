Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  namespace :api do
    namespace :v1 do
      get '/resources', to: 'resources#index'
      resources :states, only: %i[index show] do
        get '/resources', to: 'resources#show'
      end
    end
  end
end
