require 'grape'
require 'devise'

module SchoolTest
  class API < Grape::API
    version 'v1', using: :header, vendor: 'school_test'
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers

    helpers do
      def authenticate!
        user_email = options[:email].presence
        user = user_email && User.find_by_email(user_email)

        if user && Devise.secure_compare(user.authentication_token, params[:token])
          sign_in user, store: false
        # else
          # error!('Unauthorized. Invalid or expired token.', 401)
        end
      end
    end

    resource :api do
      before do
        authenticate!
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