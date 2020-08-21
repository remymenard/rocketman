Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home', as: 'homepage'
  resources :orders, only: [:index] do
      member do
        patch 'cancel'
      end
    end
  resources :rockets, only: [:index, :show] do
    resources :orders, only: [:new, :create]
  end

  namespace :owner do
    resources :orders, only: [:index] do
      member do
        get 'index_json'
        patch 'accept'
        patch 'decline'
        patch 'cancel'
      end
    end
    resources :rockets, only: [:new, :create, :index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
