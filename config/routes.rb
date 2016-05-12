Rails.application.routes.draw do
  resource :dashboard, only: [:show]
  root to: "dashboards#show"

  resources :lists
  resources :members, only: [:index, :create, :destroy], defaults: { format: :json }
  resources :friends, only: [:index]
  resource :session
end
