Rails.application.routes.draw do
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
    resources :users
    resources :songs
    
    get 'favorites/index'
    post '/favorites', to: 'favorites#create'
    delete '/favorites', to: 'favorites#destroy'
    
    get '/comments', to: 'comments#new'
    post '/comments', to: 'comments#create'
    
end