Restaurantly::Application.routes.draw do
  resources :restaurants
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  root to: "restaurants#index"
end
