Rails.application.routes.draw do
  root to: "dashboards#show"

  resources :tasks, only: [:new, :create, :show, :edit, :update, :destroy]
end
