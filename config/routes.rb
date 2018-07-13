Rails.application.routes.draw do
  get 'contact_forms/create'

  mount Attachinary::Engine => "/attachinary"
  devise_for :users, skip: [:registrations]
  root to: 'properties#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :properties, only: [:index, :show], path: 'imoveis' do
    resource :contact_forms, only: :create
  end

  namespace :admin do
    get '/', to: redirect('/admin/dashboard')
    get '/dashboard', to: 'properties#dashboard'

    resources :landlords, path: 'proprietarios'

    resources :properties, path: 'imoveis' do
      get :autocomplete_details_type_name, :on => :collection
      member do
        get :info, path: 'info'
        get :address, path: 'address'
        get :area, path: 'area'
        get :value, path: 'valor'
        get :photos, path: 'fotos'
        get :details, path: 'detalhes'
      end

    end

    resources :property_addresses, only: [:create, :update]
    resources :property_areas, only: [:create, :update]
    resources :property_values, only: [:create, :update]
    resources :property_details, only: [:create, :update]

    resources :contact_forms, only: [:index, :show, :destroy]

  end
end
