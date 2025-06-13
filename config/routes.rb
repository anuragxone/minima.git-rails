# typed: true

Rails.application.routes.draw do
    mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  devise_for :users, path: "api/v1/users", defaults: { format: :json }, controllers: {
    sessions: "api/v1/users/sessions",
    registrations: "api/v1/users/registrations"
  }, path_names: {
      sign_in: "login",
      sign_out: "logout",
      # password: "secret",
      confirmation: "verification",
      registration: "signup"
      # edit: "edit/profile"
    }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # get ":username"

  # Defines the root path route ("/")
  # root "posts#index"
end
