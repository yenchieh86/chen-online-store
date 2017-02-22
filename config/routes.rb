Rails.application.routes.draw do
  
  get '/help', to: 'static_pages#help'
  get '/contect', to: 'static_pages#contect'
  devise_for :users
  resources :users, only: [:show]
  
  resources :user, only: [] do
    resources :items, only: [:index]
  end
  
  resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
  
  resources :categories, only: [:show] do
    resources :items, only: [:index]
  end
  
  resources :items, only: [:show, :new, :create, :edit, :update, :destroy]
  
  
  root 'static_pages#home'

end
