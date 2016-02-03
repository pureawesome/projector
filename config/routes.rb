Rails.application.routes.draw do
  resources :projects, only: [:index, :show] do
    resources :tasks, only: [:index]
  end
  resources :users, only: [:index]
  root to: 'home#index'
end
