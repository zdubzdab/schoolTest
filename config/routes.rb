Rails.application.routes.draw do

  filter :locale

    root 'welcome#index'

    devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations' }

    namespace :teachers do
      resources :questions
      resources :test_settings do
        collection do
          get 'search_test_settings'
        end
      end
    end

    namespace :admin do
      resources :students, only: [:index, :edit, :update, :destroy]
      resources :tidings, only: [:show, :new, :create]
    end

    get 'welcome',    to: 'welcome#index'
end
