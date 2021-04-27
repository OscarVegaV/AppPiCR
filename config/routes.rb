Rails.application.routes.draw do
  
  
  resources :pictures
  resources :places
  devise_for :users
  
  root "places#index"
end
