Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  
  resources :animals do
    resources :bookings, only: [:new, :create, :index, :show]
    collection do                       # collection => no restaurant id in URL
      get 'ads', to: "animals#ads"  # RestaurantsController#top
    end  
  end
end

