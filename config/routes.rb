Rails.application.routes.draw do
  devise_for :users
  resources :contacts do
    member do
      get :confirm_destroy
    end
  end
  resources :appointments

  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
  match "*path", to: "application#not_found", via: :all
end
