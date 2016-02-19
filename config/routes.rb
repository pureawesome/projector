Rails.application.routes.draw do
  get 'sign_in', to: 'sessions#new', as: 'sign_in'
  post 'sign_in', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy'
  get 'landing', to: 'pages#landing', as: 'landing'


  resources :projects, only: [:index, :new, :create, :show, :edit, :update] do
    resources :tasks, only: [:new, :create, :show, :edit, :update]
  end
  resources :users, only: [:index, :new, :create, :show, :edit, :update]
  resources :resources, only: [:index, :show, :new, :create, :edit, :update]
  root to: 'home#index'
end
