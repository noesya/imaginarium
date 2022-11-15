Rails.application.routes.draw do
  match "/delayed_job" => DelayedJobWeb, :anchor => false, :via => [:get, :post]

  namespace :admin do
    resources :spaces, except: :destroy do
      member do
        get :sass
      end
      resources :images do
        member do
          get :whitelist
          get :blacklist
        end
        collection do
          get :blamed
          get :blacklisted
        end
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
  get 'politique-de-confidentialite-et-de-cookies' => 'pages#privacy', as: :privacy
  get 'assets/style' => 'pages#style', constraints: { format: 'css' }
  get 'data' => 'pages#data'
  root to: 'pages#index'
end
