Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  get "signup", to: "users#signup"

  resources :recipes
  get "recipe", to: "recipes#list"
end
