Rails.application.routes.draw do
  get '/events', to: 'events#new'
  post '/events', to: 'events#create'
  root 'users#new'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
end
