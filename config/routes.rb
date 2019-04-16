Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  post '/', to: 'sessions#create'
  get '/profile', to: 'users#show'
  post '/profile', to: 'user_items#create'
  get '/search', to: 'search#show'
  
  resources :user_likes, only: [:create]
end
