Rails.application.routes.draw do
  namespace :admin do
    resources :spaces, :questions
    resources :images, only: [:index, :show]
    resources :users, only: [:index, :show]
    root to: 'dashboard#index'
  end
  resources :images, except: [:update, :destroy] do
    member do
      get :like
      get :blame
    end
  end
  get 'a-propos' => 'pages#about', as: :about
  get 'mentions-legales' => 'pages#legal', as: :legal
  root to: 'pages#index'
end
