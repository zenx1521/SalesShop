Rails.application.routes.draw do
  devise_for :users
  resources :shop_item_images
  root :to => "shop_items#index"
  resources :shop_items do 
    member do 
      get "search" 
    end
  end 
  resources :user, only: [:show]
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
