Rails.application.routes.draw do
  resources :projects, only: [:index, :new, :create, :show] do
    resources :tasks, only: [:index]
  end
  resources :users, only: [:index, :new, :create, :show]
  root to: 'home#index'
end
