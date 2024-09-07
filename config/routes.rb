Rails.application.routes.draw do
  devise_for :users
  
  root to: "home#index"
  resources :groups do
    resources :memberships, only: [:destroy]
    resources :pending_memberships, only: [:index, :create] do
      member do
        patch "approve"
        delete "reject"
      end
    end
    resources :notices
  end
  resources :pending_memberships, only: :new
end
