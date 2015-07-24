# require 'devise'
require 'pry'

module API

  class Base < Grape::API
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers

    before do
      #header "Allow", "GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD"
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

      resource :klasses do
        get '' do
          @klasses = Klass.all
          present @klasses
        end
      end

      resource :users do
        get ':id' do
          @user = User.find(params[:id])
          data = User::Entity.represent( @user, except: [ { category: [ :created_at, :updated_at ] } ] )
          [data.as_json]
        end
      end
    end
  end

end