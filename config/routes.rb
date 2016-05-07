Rails.application.routes.draw do
  resource :dashboard, only: [:show]
  root to: "dashboards#show"

  resources :lists
  resources :members, only: [:index, :create, :destroy], defaults: { format: :json }
end
