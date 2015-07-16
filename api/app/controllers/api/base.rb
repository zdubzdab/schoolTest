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
    end
  end

end