Rails.application.routes.draw do
  root to: 'cloudies#index'
  devise_for :users
  resource :user, except: [:new, :create, :destroy]
  resources :cloudies do
    resource :likes, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  
end
