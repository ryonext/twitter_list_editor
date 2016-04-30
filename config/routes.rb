Rails.application.routes.draw do
  resource :dashboard, only: [:show]
  root to: "dashboards#show"

  resources :lists
  resources :members, only: [:create, :destroy], defaults: { format: :json }
end
