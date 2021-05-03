Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :products
      resources :favourites
      resources :questions
      resources :answers

      root to: "products#index"
    end
  resources :questions
  devise_for :users
  resources :products, only: [:index, :show]
  resources :favourites, only: [:create, :destroy, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#index'
end
