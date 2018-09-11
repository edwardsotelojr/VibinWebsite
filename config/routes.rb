Rails.application.routes.draw do
  get 'audio/index'
  get 'audio/stream'
  get 'audio/livestream'
  get 'audio/upload'
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
  resources :relationships
# Define root url
  root 'pages#index'
# Define routes for Pages
  get '/search' => 'pages#search'
  get '/home' => 'pages#home'
  get '/user/:id' => 'pages#profile'
  get 'user/:id/Music' => 'pages#profileMusic'
  get '/explore' => 'pages#explore'
  get '/groupies' => 'pages#groupies'
  get '/signup' => 'users#new'
  get '/livestream' => 'audio#stream'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
