Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :cities do
    resources :posts
  end
  
  namespace :api do
    namespace :v1 do
      resources :cities do
        resources :posts, only: [:index]
      end
    end
  end
end
