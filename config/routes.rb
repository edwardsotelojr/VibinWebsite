Rails.application.routes.draw do
  get 'users/create'
  get 'users/show'
  get 'users/search'
  devise_for :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts
  resources  :relationships
# Define root url
  root 'pages#index'
# Define routes for Pages
  get '/search' => 'pages#search'
  get '/home' => 'pages#home'
  get '/user/:id' => 'pages#profile'
  get '/explore' => 'pages#explore'
  get '/groupies' => 'pages#groupies'
  get '/signup' => 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
