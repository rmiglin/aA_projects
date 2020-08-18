Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #generates our first routes (eight routes)
  # resources :users 
  resources :users, only: [:index, :show, :create, :update, :destroy] do
    resources :artworks, only: :index 
  end
    
  resources :artwork_shares, only: [:create, :destroy]
  resources :artworks, only: [:index, :show, :create, :update, :destroy]

end

#/users/1/artworks #this is what we want to nest

#nest user and artworks!