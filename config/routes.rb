Rails.application.routes.draw do
  
  resources :places do
    resources :comments
    resources :pictures
    member do
      post 'toggle_favorite', to: "places#toggle_favorite"
    end
  end

  resources :pictures, only:[:show, :index, :edit, :destroy] do
    resources :comments

    member do
      delete 'photo', to: 'pictures#delete_photo', as: 'photo'
      post 'toggle_favorite', to: "pictures#toggle_favorite"
    end      
  end


  resources :comments do
    resources :comments
  end
  
  devise_for :users
  
  root "places#index"
end
