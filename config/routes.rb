Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  get "signup", to: "users#signup_landing"
  root "users#signup_landing"
  post 'signup', to: "users#signup"
  get 'signin', to: 'users#signin_landing'
  post 'signin', to: "users#signin"
  get 'logout', to: "users#logout"
  post 'logout', to: 'users#logout'
end
