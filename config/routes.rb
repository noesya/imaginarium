Rails.application.routes.draw do
  resources :spaces
  resources :images
  get  ':space_slug' => 'space#index', as: :show_space
  post ':space_slug/generate' => 'space#generate_image', as: :generate_image 
  get  ':space_slug/:image_id' => 'space#show_image', as: :show_image 
  root 'images#index'
end
