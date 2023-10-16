Rails.application.routes.draw do
  get 'recipes/show'
  get 'recipes/new'

  devise_for :users

  resources :ingredients, only: %i[index create new destroy]
  resources :pantry_items, only: %i[create destroy]
  resources :recipes

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
