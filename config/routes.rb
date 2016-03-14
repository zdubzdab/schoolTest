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
      resources :tidings
     end

    resources :comments, only: [:index, :create, :new]

    namespace 'students' do
      resources 'test_settings', only: [:index, :show] do
        get "download"
        get 'search_test_settings', on: :collection
        resources 'tests', only: [:new, :create, :show] do
           post 'finish_test', on: :collection
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
