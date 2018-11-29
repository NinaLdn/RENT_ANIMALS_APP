Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :animals do
    resources :bookings, only: [:new, :create, :index, :show]
    collection do                       # collection => no restaurant id in URL
      get 'ads', to: "animals#ads"  # RestaurantsController#top
    end
    collection do                       # collection => no restaurant id in URL
      get 'reservations', to: "bookings#reservations"  # RestaurantsController#top
    end
  end
  resources :reviews, only: [:destroy]
  resources :bookings, only: [:index] do
    resources :reviews, only: [:new, :create]
  end
end



