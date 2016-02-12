Rails.application.routes.draw do
  resources :projects, only: [:index, :new, :create, :show, :edit, :update] do
    resources :tasks, only: [:index, :new, :create, :show]
  end
  resources :users, only: [:index, :new, :create, :show]
  root to: 'home#index'
end
