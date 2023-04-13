Rails.application.routes.draw do
  root "events#new"

  resources :events, only: [:new, :create, :show]
  resources :session, only: [:create, :destroy]

  get "/login", to: "sessions#login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
