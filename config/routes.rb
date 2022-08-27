Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
  namespace :api do
    namespace :v1 do
      get '/resources', to: 'resources#index'
      get '/misinformation_centers', to: 'misinformation_centers#index'
      resources :states, only: %i[index show] do
        get '/resources', to: 'resources#show'
        get '/misinformation_centers', to: 'misinformation_centers#show'
      end
    end
  end
end
