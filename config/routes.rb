Rails.application.routes.draw do
  get 'songs/new'
  get 'sessions/new'
  root 'pages#index'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  put "users/:id/update" => "users#update"
    resources :users
    resources :songs
end