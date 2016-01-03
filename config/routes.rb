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
      resources :comments, only: [:index, :destroy]
      resources :students, only: [:index, :edit, :update, :destroy]
      resources :users, only: [:index, :edit, :update, :destroy]
      resources :tidings, only: [:show, :new, :create]
     end

    resources :comments, only: [:index, :create, :new]

    namespace :students do
      get 'profile',  to: "persons#profile"
    end

  namespace 'students' do
    resources 'persons' do
      collection do
        get 'search_test_settings'
      end
    end
  end

    get 'welcome',    to: 'welcome#index'    
    
    resources :users, only: [:index]

    get 'welcome',    to: 'welcome#index'
    
    resources :welcome do
      collection do
        get 'search'
      end
    end

end



