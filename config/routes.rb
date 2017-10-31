Rails.application.routes.draw do
  devise_for :users
  root to: 'properties#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :properties, only: [:index, :show]

  namespace :admin do
    get '/', to: 'properties#dashboard'
    resources :properties, only: [:index, :show]
    resources :landlords do
      resources :properties do
        collection do
          get :info
        end

        member do
          get :address
          get :info
        end

        resource :property_addresses, only: [:new, :create, :update]
        resource :property_areas, only: [:new, :create, :update]
        resource :property_values, only: [:new, :create, :update]
      end
    end
  end
end
