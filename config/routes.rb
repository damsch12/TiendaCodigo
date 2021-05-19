# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :stats, only: [:index]
    resources :users
    resources :products
    resources :favourites, except: :index
    resources :questions
    resources :answers, except: :index

    root to: 'stats#index'
  end
  resources :questions
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :products, only: %i[index show]
  resources :favourites, only: %i[create destroy index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#index'
end
