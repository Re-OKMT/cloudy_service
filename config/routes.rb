Rails.application.routes.draw do
  devise_for :users
  root to: 'cloudies#index'
  resources :cloudies
  resources :users, only: :show
end
