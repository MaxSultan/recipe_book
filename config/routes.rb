Rails.application.routes.draw do

  devise_for :users
  resources :ingredients, only: %i[index create new destroy]
  post 'add_to_pantry', to: 'ingredients#add_to_pantry', as: 'add_to_pantry'
  resources :pantry_ingredients, only: %i[create, destroy, new]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
