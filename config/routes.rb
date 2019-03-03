Rails.application.routes.draw do
  root "boards#index"
  devise_for :users
  resources :boards do
    resources :lists
  end
end
