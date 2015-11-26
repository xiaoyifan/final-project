Rails.application.routes.draw do

  root 'pages#home'

  resources :products

  get '/auth/twitter/callback' => 'sessions#create'

  get '/pages/:action', controller: 'pages'

  get '/logout' => 'sessions#destroy'

  get '/inventory' => 'pages#inventory'
  post '/on_hand' => 'pages#on_hand_left'
  get '/purchase' => 'pages#create'

end
