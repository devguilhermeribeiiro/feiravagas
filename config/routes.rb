Rails.application.routes.draw do
  resources :employers, only: %i[show edit update destroy] do
    resources :jobs
    collection do
      get :unconfirmed
    end
  end

  resources :jobseekers, only: %i[show edit update destroy] do
    get "jobs", to: "jobseekers#index", as: :index
    get "jobs/:id", to: "jobseekers#job", as: :jobs

    collection do
      get :unconfirmed
    end
  end

  # Defines the root path route ("/")
  root "home#index"

  devise_for :job_seekers, controllers: {
    registrations: "job_seekers/registrations"
  }

  devise_for :employers, controllers: {
    registrations: "employers/registrations"
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
