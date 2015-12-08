Rails.application.routes.draw do

  filter :locale

    root 'welcome#index'

    devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations' }

    namespace :teachers do
      resources :test_settings
    end

  match 'welcome',    to: 'welcome#index',    via:  [:get]
end
