Rails.application.routes.draw do
  get 'space_ratings/create'
  get 'bookings/create'
  devise_for :users
  root to: "spaces#index"

  resources :spaces, except: :index do
    resources :bookings, only: [:create, :show]
    resources :space_ratings, only: :create
    resources :booking_dates, only: [:new, :create]
  end

  resources :booking_dates, only: :destroy
  resources :bookings, only: :update

  resources :dashboards, only: :index do
    collection do
      get "/infos", to: "dashboards#infos"
      get "/favoris", to: "dashboards#favoris"
      get "/bookings", to: "dashboards#bookings"
      get "/wishspace", to: "dashboards#wishspace"
      get "/wishspace/new", to: "dashboards#new_wishspace"
      post "/wishspace/create", to: "dashboards#create_wishspace"
      get "/owner", to: "dashboards#owner" #reservations des locaux du owner
    end
  end
  resources :messages, only: :create
  get "/search", to: "spaces#results", as: "search_results"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
