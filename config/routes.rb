Rails.application.routes.draw do
  # Letter opener web interface.
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  # Devise User model routes config
  devise_for :users, defaults: { format: :json }, path: "auth",
             path_names: { sign_in: "signin",
                           sign_out: "signout",
                           # password: 'secret',
                           # confirmation: 'verification',
                           # unlock: 'unblock',
                           registration: "signup"
             },
             controllers: {
               sessions: "users/sessions",
               registrations: "users/registrations"
             }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Repositories routes config
  # resources :repos
  root "repos#all"
  get "/:user_slug", to: "repos#index", user_slug: /(?!auth$|letter_opener$|favicon$|new$)[a-zA-Z0-9_]+/
  get "/:user_slug/:repo_slug", to: "repos#show", as: :user_repo
  get "/:user_slug/:repo_slug/tree/*path", to: "repos#tree"
  get "/:user_slug/:repo_slug/commits", to: "repos#commits"
  post "/new", to: "repos#create"


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
