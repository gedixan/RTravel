Rails.application.routes.draw do
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  #get '/buses', to: 'buses#index'
  #get '/buses/new', to: 'buses#new', as: :new_bus
  #post '/buses', to: 'buses#create'
  #get '/buses/:id', to: 'buses#show', as: :bus
  #get '/buses/:id/edit', to: 'buses#edit', as: :edit_bus
  #put '/buses/:id', to: 'buses#update'
  #delete'/buses/:id', to: 'buses#destroy'

  resources :home, only: [:index]

  resources :buses do
    resources :seatings, except: [:show]
  end

  resources :areas

  #test route
  resources :roles, except: [:destroy]

  resources :users

#  devise_for :users do
#    resources :users do
#    get '/users/sign_in', to: 'devise/sessions#new'
#    get '/users/sign_out', to: 'devise/sessions#destroy'
#    post 'user_create', to: 'users#create'
#    end
#  end
  #rutas - verbos https


end
