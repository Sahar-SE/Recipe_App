Rails.application.routes.draw do
  devise_for :users
  get 'recipes/index', to: 'recipes#public'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "recipes#public"
  resources :users 
  resources :foods
  resources :recipes
end
