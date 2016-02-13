Rails.application.routes.draw do
  resources :projects, only: [:index, :new, :create, :show, :edit, :update] do
    resources :tasks, only: [:index, :new, :create, :show, :edit, :update]
  end
  resources :users, only: [:index, :new, :create, :show]
  resources :resources, only: [:index]
  root to: 'home#index'
end
