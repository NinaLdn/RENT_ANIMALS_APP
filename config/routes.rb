Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :animals do
    collection do                       # collection => no restaurant id in URL
      get 'ads', to: "animals#ads"  # RestaurantsController#top
    end
  end
end

