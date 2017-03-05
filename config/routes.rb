Rails.application.routes.draw do
  
  get '/:user_id/shopping_cart', to: 'orders#unpaid_order', as: 'shopping_cart'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/mostpopular', to: 'static_pages#mostpopular', as: 'mostpopular'
  get '/mostpopular/items', to: 'static_pages#mostpopular_items', as: 'mostpopular_items'
  get '/onsale', to: 'static_pages#onsale', as: 'onsale'
  get '/newarrival', to: 'static_pages#newarrival', as: 'newarrival'
  get '/newarrival/items', to: 'static_pages#newarrival_items', as: 'newarrival_items'
  
  
  
  resources :orders, only: [] do
    resources :order_items, only: [:index, :show, :edit, :update, :show, :destroy]
  end
  
  devise_for :users
  root 'static_pages#home'
  
  
  
  
  
  
  
  
  
  
  
  
  get '/control_target/target_product_list/:id', to: 'control_target#target_product_list', as: 'target_product_list'
  get '/control_target/target_wish_list/:id', to: 'control_target#target_wish_list', as: 'target_wish_list'
  get '/control_target/target_review_list/:id', to: 'control_target#target_review_list', as: 'target_review_list'
  get '/control_target/target_order_list/:id', to: 'control_target#target_order_list', as: 'target_order_list'
  
  
  resources :users, only: [:index, :show]
  
  
  
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
  
  
  resources :searches, only: [:index]
  resources :messages
  
  resources :user, only: [] do
    resources :items, only: [:index]
    resources :orders, only: [:index, :show, :edit, :update, :create, :show, :destroy]
    resources :charges, only: [:new, :create]
  end
  
  
  
  
  
  

end