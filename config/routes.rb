Rails.application.routes.draw do
 # resources :items, only: :index
  devise_for :users
 
  root to: 'items#index'

  
end
