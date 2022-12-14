Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  namespace :api do
    namespace :v1 do
      get '/resources', to: 'resources#index'
      get '/misinformation_centers', to: 'misinformation_centers#index'
      get '/authorized_clinics', to: 'authorized_clinics#index'
      resources :states, only: %i[index show] do
        get '/resources', to: 'resources#show'
        get '/misinformation_centers', to: 'misinformation_centers#show'
        get '/authorized_clinics', to: 'authorized_clinics#show'
      end
    end
  end
end
