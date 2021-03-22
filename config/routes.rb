Rails.application.routes.draw do
  get '/events', to: 'events#new'
  get '/events/:id', to: 'events#show', as: 'event'
  post '/events', to: 'events#create'
  root 'users#new'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
end
