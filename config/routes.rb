Rails.application.routes.draw do

 



  resources :owners
  resources :reviews ,except: [:update,:destroy]
  resources :properties


  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/signup", to: "owners#create"
  post "/login", to: "sessions#create"
  get "/me", to: "sessions#show"
  delete "/logout", "sessions#destroy"

end
