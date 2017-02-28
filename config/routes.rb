Rails.application.routes.draw do
  
  get '/help', to: 'static_pages#help'
  get '/contect', to: 'static_pages#contect'
  get '/control_target/target_product_list/:id', to: 'control_target#target_product_list', as: 'target_product_list'
  get '/control_target/target_wish_list/:id', to: 'control_target#target_wish_list', as: 'target_wish_list'
  get '/control_target/target_review_list/:id', to: 'control_target#target_review_list', as: 'target_review_list'
  get '/control_target/target_order_list/:id', to: 'control_target#target_order_list', as: 'target_order_list'
  
  devise_for :users
  resources :users, only: [:index, :show]
  
  resources :user, only: [] do
    resources :items, only: [:index]
    resources :orders, only: [:index, :show, :edit, :update, :create, :show, :destroy]
    resources :charges, only: [:new, :create]
  end
  
  resources :categories
  
  resources :categories, only: [] do
    resources :items, only: [:index]
  end
  
  resources :items, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :reviews, only: [:destroy]
  
  resources :items, only: [] do
    resources :reviews, only: [:index, :create, :new]
    resources :wish_lists, only: [:index, :create]
    resources :order_items, only: [:create]
  end
  
  resources :order_items, only: [:index, :show, :edit, :update, :show, :destroy]
  resources :searches, only: [:index]
  
  root 'static_pages#home'

end