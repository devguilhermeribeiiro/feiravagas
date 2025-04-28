Rails.application.routes.draw do
  devise_for :job_seekers, controllers: {
    registrations: "job_seekers/registrations",
    confirmations: "job_seekers/confirmations"
  }

  devise_for :employers, controllers: {
    registrations: "employers/registrations",
    confirmations: "employers/confirmations"
  }

  resources :dashboard, only: %i[show edit update destroy] do
    collection do
      get :unconfirmed, to: "dashboard#unconfirmed"
    end
  end

  resources :jobseekers, only: %i[show edit update destroy] do
    get "jobs", to: "jobseekers#index", as: :index
    get "jobs/:id", to: "jobseekers#job", as: :jobs
    get "candidatures", to: "jobseekers#candidatures"

    collection do
      get :unconfirmed, to: "jobseekers#unconfirmed"
    end
  end

  resources :jobs

  # Defines the root path route ("/")
  root "home#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
