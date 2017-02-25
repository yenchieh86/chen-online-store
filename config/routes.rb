Rails.application.routes.draw do

  get '/help', to: 'static_pages#help'
  get '/contect', to: 'static_pages#contect'
  get '/control_target/target_product_list/:id', to: 'control_target#target_product_list', as: 'target_product_list'
  get '/control_target/target_wish_list/:id', to: 'control_target#target_wish_list', as: 'target_wish_list'
  get '/control_target/target_review_list/:id', to: 'control_target#target_review_list', as: 'target_review_list'

  
  devise_for :users
  resources :users, only: [:index, :show]
  
  resources :user, only: [] do
    resources :items, only: [:index]
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
  end
  
  
  
  
  root 'static_pages#home'

end