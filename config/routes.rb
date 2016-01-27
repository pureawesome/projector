Rails.application.routes.draw do
 resources :projects, only: [:index]
 resources :users, only: [:index]
 root to: 'home#index'
end
