Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users
  root to: 'properties#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :properties, only: [:index, :show] do
  end

  namespace :admin do
    get '/', to: 'properties#dashboard'

    resources :properties, only: [:index, :show, :update, :destroy] do
      resources :property_addresses, only: [:create, :update]
      resources :property_areas, only: [:create, :update]
      resources :property_values, only: [:create, :update]
    end

    resources :landlords do
      resources :properties do
        member do
          get :info
          get :address
          get :area
          get :value
          get :photos
        end
      end
    end
  end

end
