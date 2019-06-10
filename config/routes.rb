Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :shop_item_images
  root :to => "shop_items#index"
  resources :shop_items do 
    member do 
      get "search" 
    end
  end 

  post '/buckets', to: 'buckets#realize_payments'
  resources :bucket_items, only: [:create,:destroy]
  resources :user, only: [:show]
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
