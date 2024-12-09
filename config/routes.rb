Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  
  resources :groups do
    resources :memberships, only: [:destroy]
    resources :notices do
      resources :comments, only: :create
    end
    resources :circulars, except: [:edit, :update]
    resources :pending_memberships, only: [] do
      member do
        patch "approve"
        delete "reject"
      end
    end
  end
  resources :users, only: [:show, :edit, :update]
  resources :pending_memberships, only: [:new, :create]
  resources :reads, only: [:create]
  post "notices/generate_content", to: "notices#generate_content"
end
