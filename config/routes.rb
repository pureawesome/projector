Rails.application.routes.draw do
  resources :projects, only: [:index, :new, :create, :show, :edit, :update] do
    resources :tasks, only: [:new, :create, :show, :edit, :update]
  end
  resources :users, only: [:index, :new, :create, :show, :edit, :update]
  resources :resources, only: [:index, :show, :new, :create]
  root to: 'home#index'
end
