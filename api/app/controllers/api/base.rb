# require 'devise'
require 'pry'

module API

  class Base < Grape::API
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers

    before do

    end

    helpers do
      def current_user
        @current_user ||= User.authorize!(env)
      end

      #def authenticate!
        #binding.pry
      #end
    end

    resource "/" do
      before do
        # authenticate!
      end

      # TODO: return categgories for user registration page
      # resource :klasses do
      #   get '' do
      #     @klasses = Klass.all
      #     present @klasses
      #   end
      # end

      namespace :users do
        get ':id' do
          @user = User.find(params[:id])
          data = User::Entity.represent( @user, except: [ { categgory: [ :created_at, :updated_at ] } ] )
          [data.as_json]
        end

        post 'sign_in' do
          super
        end
      end

      get 'get_test_settings' do
        @tests_settings = TestSetting.where( subject_id: params[:subject_id], categgory_id: params[:categgory_id] )
        present @tests_settings
      end
    end
  end

end