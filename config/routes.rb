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

  resources :recipes
  get 'recipe_list' ,to: 'recipes#list'
  get 'recipe_item', to: 'recipes#show'
  post 'add_recipe', to: 'recipes#add'
  get 'edit_recipe', to: 'recipes#edit'
  post 'edit_recipe',to: 'recipes#edit'
  post 'delete_recipe',to: 'recipes#delete'
  patch 'recommend', to: 'recipes#recommend'


  resources :comments
  post "post_comment", to: 'comments#add'
  post "delete_comment", to: 'comments#delete'
  get 'display_comments', to: 'comments#display'
end
