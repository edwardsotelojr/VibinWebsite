Rails.application.routes.draw do
  devise_for :users
    resources :users do
      member do
        get :following, :followers
      end
    end
      resources:posts
      resources:relationships
# Define root url
        root 'pages#index'
# Define routes for Pages
          get '/home' => 'pages#home'
          get '/user/:id' => 'pages#profile'
          get '/explore' => 'pages#explore'
          get '/groupies' => 'pages#groupies'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
