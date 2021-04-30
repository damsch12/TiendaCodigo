Rails.application.routes.draw do
  resources :questions
  devise_for :users
  resources :products
  resources :favourites, only: [:create, :destroy, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#index'
end
