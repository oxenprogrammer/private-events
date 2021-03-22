Rails.application.routes.draw do
  root 'users#new'
  get '/events', to: 'events#new'
  get '/events/:id', to: 'events#show', as: 'event'
  post '/events', to: 'events#create'

  get '/invitations', to: 'invitations#new'
  get '/invitations/:id', to: 'invitations#show', as: 'invitation'
  post '/invitations', to: 'invitations#create'


  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
end
