Rails.application.routes.draw do  
  #devise_for :accounts
  root  "users#index"

  resources :comments
  resources :microposts
  resources :users do
    resources :posts    #get /users/1/posts/
  end

  get   '/login', to: 'sessions#new'
  post  '/login', to: 'sessions#create'
  delete'/logout', to: 'sessions#destroy'
  get   "/users/:id/microposts", to: 'users#show_microposts'
  get   "/comments/:user_id/:micropost_id", to: 'comments#show_detail'
  post  "/microposts/:id/upload-file", to: 'microposts#upload_single_file'

  get   '/users/:id/follow', to: 'relationships#show'
  post  '/users/:id/follow/:followed_id', to: 'relationships#create'
  delete'/users/:id/follow/:followed_id', to: 'relationships#destroy'


  ########
  # devise_for :users

  # resources :users, only: [:index, :show] do
  #   resources :microposts  do
  #     resources :comments                   # get /users/1/microposts/1/comments
  #   end
  # end
  # resources :microposts, only: [:show, :index, :new, :create, :update, :destroy]
  # resources :users, only: [:edit, :update, :destroy]   
  # resources :comments, only: [:index, :show]
  # draw(:admin)
end
