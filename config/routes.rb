Rails.application.routes.draw do
  root "pages#home"
  get  "about", to: "pages#about"

  resources :airports, only: [:index, :show]
  resources :airlines, only: [:index, :show]
  resources :routes,   only: [:index, :show]
end
