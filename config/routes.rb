Rails.application.routes.draw do
  devise_for :users
  root to: 'properties#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :properties, only: [:index, :show]

  namespace :admin do
    get 'overview', to: 'properties#overview'
    resources :properties, only: [:index, :show]
    resources :landlords do
      resources :properties
    end
  end

end
