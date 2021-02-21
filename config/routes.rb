Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  match "/delayed_job" => DelayedJobWeb, :anchor => false, :via => [:get, :post]

  namespace :api do
    namespace :v1 do
      resources :cities do
        resources :posts, only: [:index], defaults: { format: :json }
      end
    end
  end
end
