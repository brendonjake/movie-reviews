Rails.application.routes.draw do
  root "movies#index"

  resources :genres
  resources :users

  get "signup" => "users#new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]
  get "signin" => "sessions#new"
  # Defines the root path route ("/")

  get "movies/filter/:filter" => "movies#index", as: :filtered_movies

  resources :movies do
    resources :reviews
    resources :favorites, only: [:create, :destroy]
  end
end
