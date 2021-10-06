Rails.application.routes.draw do
  root to: 'cloudies#index'
  devise_for :users
  resource :user, except: [:new, :create, :destroy]
  resources :cloudies do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  
end
