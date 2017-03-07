Rails.application.routes.draw do
  
  devise_for :users
  resources :users, only: [:index, :show]
  
  resources :user, only: [] do
    resources :items, only: [:index]
    resources :orders, only: [:create,:index, :show, :edit, :update, :destroy]
    resources :charges, only: [:new, :create]
  end
  
  resources :orders, only: [] do
    resources :order_items, only: [:index, :show, :edit, :update, :show, :destroy]
  end
  
  
  
  resources :categories
  resources :categories, only: [] do
    resources :items, only: [:index]
  end
  
  resources :items, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :items, only: [] do
    resources :reviews, only: [:index, :create, :new]
    resources :wish_lists, only: [:index, :create]
    resources :order_items, only: [:create]
  end
  
  resources :reviews, only: [:destroy]
  resources :searches, only: [:index]
  resources :messages
  
  get '/:user_id/shopping_cart', to: 'orders#unpaid_order', as: 'shopping_cart'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/mostpopular', to: 'static_pages#mostpopular', as: 'mostpopular'
  get '/mostpopular/items', to: 'static_pages#mostpopular_items', as: 'mostpopular_items'
  get '/onsale', to: 'static_pages#onsale', as: 'onsale'
  get '/newarrival', to: 'static_pages#newarrival', as: 'newarrival'
  get '/newarrival/items', to: 'static_pages#newarrival_items', as: 'newarrival_items'
  
  get '/user/orders/:id/change_order_status_to_placed', to: 'orders#change_order_status_to_placed', as: 'chage_order_status_to_placed'
  get '/user/orders/:id/change_order_status_to_shipped', to: 'orders#change_order_status_to_shipped', as: 'chage_order_status_to_shipped'
  get '/user/orders/:id/change_order_status_to_delivered', to: 'orders#change_order_status_to_delivered', as: 'chage_order_status_to_delivered'
  get '/user/orders/:id/change_order_status_to_received', to: 'orders#change_order_status_to_received', as: 'chage_order_status_to_received'
  
  
  
  get '/control_target/target_product_list/:id', to: 'control_target#target_product_list', as: 'target_product_list'
  get '/control_target/target_wish_list/:id', to: 'control_target#target_wish_list', as: 'target_wish_list'
  get '/control_target/target_review_list/:id', to: 'control_target#target_review_list', as: 'target_review_list'
  get '/control_target/target_order_list/:id', to: 'control_target#target_order_list', as: 'target_order_list'
  
  root 'static_pages#home'
end