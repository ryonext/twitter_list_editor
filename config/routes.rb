Rails.application.routes.draw do
  resource :dashboard, only: [:show]
  root to: "dashboard#show"
end
