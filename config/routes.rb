Rails.application.routes.draw do

  root 'pages#home'

  resources :products

  get '/auth/twitter/callback' => 'sessions#create'

  get '/pages/:action', controller: 'pages'

  get '/logout' => 'sessions#destroy'
  
end
