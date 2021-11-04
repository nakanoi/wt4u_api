Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: { 
        registrations: 'api/v1/auth/registrations'
      }

      namespace :auth do
        resources :sessions, only: %i[index]
      end

      resources :types, only: [:index, :create]
      resources :agents, only:  [:index, :create]
      resources :requests, only: [:index, :create, :show]
      resources :rooms, only: [:index, :create, :show]
      resources :messages, only: [:index, :create, :show]
      resources :members, only: [:index, :create, :show]
    end
  end
end
