Rails.application.routes.draw do
  devise_for :users
  
  root to: "home#index"
  resources :groups do
    resources :users, only: [:show, :edit, :update]
    resources :memberships, only: [:destroy]
    resources :pending_memberships, only: [:create] do
      member do
        patch "approve"
        delete "reject"
      end
    end
    resources :notices do
      resources :comments, only: :create
      member do
        post "mark_as_read"
      end
    end
    resources :circulars, except: [:edit, :update] do
      member do
        post "read_create"
      end
    end
  end
  resources :pending_memberships, only: :new
end
