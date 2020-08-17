Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :orders, only: [:index]
  resources :rockets, only: [:index, :show] do
    resources :orders, only: [:new, :create]
  end
  resources :orders, only: [:index]

  namespace :owners do
    resources :orders, only: [:index] do
      member do
        patch 'accept'
        patch 'decline'
      end
    end
    resources :rockets, only: [:new, :create, :index, :destroy, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
