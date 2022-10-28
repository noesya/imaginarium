Rails.application.routes.draw do
  namespace :admin do
    resources :spaces do
      member do
        get :sass
      end
    end
    resources :questions
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
  resource :user, only: [:update]
  get 'a-propos' => 'pages#about', as: :about
  get 'mentions-legales' => 'pages#legal', as: :legal
  get 'assets/style' => 'pages#style', constraints: { format: 'css' }
  root to: 'pages#index'
end
