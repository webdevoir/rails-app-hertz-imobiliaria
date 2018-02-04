Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users, skip: [:registrations]
  root to: 'properties#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :properties, only: [:index, :show] do
  end

  namespace :admin do

    get '/', to: 'properties#dashboard'

    resources :landlords

    resources :properties do
      get :autocomplete_details_type_name, :on => :collection
      member do
        get :info
        get :address
        get :area
        get :value
        get :photos
        get :details
      end
    end

    resources :property_addresses, only: [:create, :update]
    resources :property_areas, only: [:create, :update]
    resources :property_values, only: [:create, :update]
    resources :property_details, only: [:create, :update]

  end
end
