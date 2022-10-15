Rails.application.routes.draw do
  resources :shopping_list
  devise_for :users
  get 'recipes/index', to: 'recipes#public'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "recipes#public"
  resources :users do
    resources :recipes do
      resources :shopping_list, only: [:index ,:show]
    end
  end
  resources :foods
  resources :recipes
end
