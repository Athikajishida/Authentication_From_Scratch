Rails.application.routes.draw do
  get 'login', to: 'user/sessions#new', as: "login"
  delete 'logout', to: 'user/sessions#destroy', as: "logout"

  namespace :user do
    namespace :account do
      resource :password_reset # reset password for account when not logged in
      resource :password # update password for account while logged in
      resource :email_confirmation # confirmation email to confirm user account
    end
    resource :sessions
    resource :registration # user registration
  end
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "main#index"
end