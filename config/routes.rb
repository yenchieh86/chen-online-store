Rails.application.routes.draw do

  get '/help', to: 'static_pages#help'
  get '/contect', to: 'static_pages#contect'
  devise_for :users
  resources :users, :only => [:show]
  resources :items
  root 'static_pages#home'

end
