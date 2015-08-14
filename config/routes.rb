Rails.application.routes.draw do

  get 'log_out' => 'sessions#destroy', as: 'log_out'

  get 'log_in' => 'sessions#new', as: 'log_in'

  get 'sign_up' => 'users#new', as: 'sign_up'

  resources :users
  resources :sessions

  resources :articles do
    resources :comments
  end
  
  resources :tags, only: [:index]

  root 'welcome#index'
end
