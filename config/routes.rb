Rails.application.routes.draw do
 # resources :items, only: :index
  root 'items#index'

  devise_for :users
end
