Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #get 'posts', to: 'posts#index'
  root to: 'items#index'
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy]

  #resources :users only: :show               
end
