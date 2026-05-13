Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  devise_for :users

  root "store/home#index"
  resources :products
  resource :card, only: [ :show ] do
    post :add_item
    delete :remove_item
    patch :update_item
  end

  namespace :account do
    root "dashboard#index"
  end

  namespace :backoffice do
    root "dashboard#index"
  end
end
