Restaurantly::Application.routes.draw do
  devise_for :users
  resources :restaurants
  root to: "restaurants#index"
end
