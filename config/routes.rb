Rails.application.routes.draw do
 resources :projects, only: [:index]
 root to: 'home#index'
end
