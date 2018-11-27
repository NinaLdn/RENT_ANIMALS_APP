Rails.application.routes.draw do
  devise_for :users
  resources :animals do
    resources :bookings, only: [:new, :create, :index, :show]
  end
  root to: 'pages#home'
end

