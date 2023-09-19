Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
    resources :users ,:songs ,:albums
    post '/auth/login', to: 'authentication#login'
    post 'password/forgot', to: 'passwords#forgot'
    post 'password/reset', to: 'passwords#reset'
end
