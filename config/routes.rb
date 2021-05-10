Rails.application.routes.draw do
  
  resources :places do
    resources :comments
    resources :pictures
  end

  resources :pictures, only:[:show, :index, :edit, :destroy] do
    resources :comments

    member do
      delete 'photo', to: 'pictures#delete_photo', as: 'photo'
      end
  end


  resources :comments do
    resources :comments
  end
  devise_for :users
  
  root "places#index"
end
