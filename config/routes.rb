Rails.application.routes.draw do
  devise_for :users
  
  root to: "home#index"
  resources :groups do
    resources :memberships, only: [:create, :destroy]
    resources :pending_memberships, only: [:new, :create, :destroy]
  end
end
