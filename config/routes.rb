Rails.application.routes.draw do
  namespace :admin do
    resources :spaces
    resources :images, only: [:index, :show]
    root to: 'dashboard#index'
  end
  get  ':space_slug' => 'space#index', as: :show_space
  post ':space_slug/generate' => 'space#generate_image', as: :generate_image 
  get  ':space_slug/:image_id' => 'space#show_image', as: :show_image 
  get  ':space_slug/:image_id/like' => 'space#like_image', as: :like_image 
  get  ':space_slug/:image_id/blame' => 'space#blame_image', as: :blame_image 
  root to: 'home#index'
end
