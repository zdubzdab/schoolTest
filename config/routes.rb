Rails.application.routes.draw do

  filter :locale

    root 'welcome#index'

    devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations' }

    namespace :teachers do
      resources :questions
      resources :test_settings do
        resources :users, only: [:show]
        collection do
          get 'search_test_settings'
        end
      end
    end

    namespace :admin do
      resources :comments, only: [:index, :destroy]
      resources :students, only: [:index, :edit, :update, :destroy]
      resources :users, only: [:index, :edit, :update, :destroy]
      resources :tidings, only: [:new, :create]
     end

    resources :comments, only: [:index, :create, :new]

    namespace 'students' do
      resources 'test_settings', only: [:index, :show] do
        resources 'tests', only: [:new, :create, :index]
        collection do
          get 'search_test_settings'
        end
      end
    end

    resources :users, only: [:index]

    resources :welcome, only: [:index, :show] do
      collection do
        get 'search'
      end
    end

end
