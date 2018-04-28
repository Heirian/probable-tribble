Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    devise_scope :user do
      get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
      post 'sign_in', to: 'devise/sessions#create', as: :user_session
      delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
      get '/sign_up', to: 'users/registrations#new', as: 'new_user_registration' # custom path to sign_up/registration
      post '/sign_up', to: 'users/registrations#create', as: 'user_registration'
      get '/reset_password', to: 'users/passwords#new', as: 'new_reset_password'
      post '/reset_password', to: 'users/passwords#create', as: 'reset_password'
    end

    resource :user, only: [:edit] do
      collection do
        patch 'update_password'
      end
    end

    devise_for :users, skip: [:sessions]
    root to: 'home#index'
    resources :profiles
    resources :developers, except: [:destroy]
    resources :genres, except: [:destroy]
    resources :games, except: [:destroy]
    resources :categories, except: [:destroy]
    resources :articles
    resources :communities
    resources :memberships, only: %i[create update destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
