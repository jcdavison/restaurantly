Restaurantly::Application.routes.draw do
  resources :restaurants
  root to: "restaurants#index"
end
