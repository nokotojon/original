Rails.application.routes.draw do
  get 'rappers/index'
  get 'rappers/new'
  
  
  get 'pages/about'
  
  get 'songs/new'
  get 'songs/rank'
  get 'songs/sort'
  post 'songs/sort'
  
  get 'sessions/new'
  root 'pages#index'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  put "users/:id/update" => "users#update"
  
  get 'rappers/rank'
  put "rappers/:id/update" => "rappers#update"
  delete "/rappers/:id/destroy", to: "rappres#destroy"
    resources :users
    resources :songs
    resources :rappers
    
    get 'votes/index'
    post '/votes', to: 'votes#create'
    delete '/votes', to: 'votes#destroy'
    
    get 'favorites/index'
    post '/favorites', to: 'favorites#create'
    delete '/favorites', to: 'favorites#destroy'
    
    get '/comments', to: 'comments#new'
    post '/comments', to: 'comments#create'
    
end