Rails.application.routes.draw do
  
  resources :places do
    resources :comments
  end

  resources :pictures do
    resources :comments
  end

  resources :comments do
    resources :comments
  end
  devise_for :users
  
  root "places#index"
end
