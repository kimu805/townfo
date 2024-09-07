Rails.application.routes.draw do
  devise_for :users
  
  root to: "home#index"
  resources :groups do
    resources :memberships, only: [:destroy]
    resources :pending_memberships, only: [:create] do
      member do
        patch "approve"
        delete "reject"
      end
    end
  end
end
