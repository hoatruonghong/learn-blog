Rails.application.routes.draw do  
  resources :comments
  resources :microposts
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "application#hello"
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get "/users/:id/microposts", to: 'users#show_microposts'
  get "/comments/:user_id/:micropost_id", to: 'comments#show_detail'
  # post "/api/login", to: 'authentication#login'
  post "/microposts/:id/upload-file", to: 'microposts#upload_single_file'

end
