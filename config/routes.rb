Rails.application.routes.draw do
  devise_for :users
  resources :animals
  root to: 'pages#home'
end

