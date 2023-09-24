Rails.application.routes.draw do
  resources :favorites
  resources :users
  get "signup" => "users#new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]
  get "signin" => "sessions#new"
  # Defines the root path route ("/")
  root "movies#index"

  resources :movies do
    resources :reviews
  end
end
