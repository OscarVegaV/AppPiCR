Rails.application.routes.draw do
  
  
  resources :pictures
  resources :places
  devise_for :users
  root to: "places#index"
end
