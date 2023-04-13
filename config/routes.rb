Rails.application.routes.draw do
  root "events#new"

  resources :events, only: [:new, :create, :show]
  resources :sections, only: [:new, :create, :edit, :update, :destroy]

  get "/login", to: "sessions#login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
