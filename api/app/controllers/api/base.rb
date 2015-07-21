# require 'devise'
require 'pry'

module API

  class Base < Grape::API
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers

    helpers do
      def current_user
        @current_user ||= User.authorize!(env)
      end

      # def authenticate!
        # NOTICE: possible cancan authorization
      # end
    end

    resource "/" do
      before do
        # authenticate!
      end

      resource :klasses do
        get '', each_serializer:  KlassSerializer do
          @klass = Klass.all
          present @klass
        end
      end

      resource :users do
        get ':id' do
          @user = User.find(params[:id])
          # present @user

          data = User::Entity.represent( @user, only: [ :id, :full_name, :email, { category: [:id] } ] )
          data.as_json
        end
      end
    end
  end

end