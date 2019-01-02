Rails.application.routes.draw do
  root to: "dashboards#show"

  resources :tasks, only: [:new, :create, :show, :edit, :update, :destroy, :add_contact] do
    get :add_contact
  end

  resources :details do
    get :check_date
  end

  get '*path' => redirect('/')
end
