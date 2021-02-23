Rails.application.routes.draw do

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  namespace :api do
    namespace :v1 do
      resources :cities do
        resources :posts, only: [:index], defaults: { format: :json }
      end
    end
  end
end
