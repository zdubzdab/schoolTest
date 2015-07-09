module SchoolTest
  class API < Grape::API
    version 'v1', using: :header, vendor: 'school_test'
    format :json

    helpers do
      def authenticate!
        #in this helper we will check token
        if @api_client = ApiClient.find_by_token(params[:token])
          return true
        else
          error!('401 Unauthorized', 401)
        end
      end

      def order_params params
        ActionController::Parameters.new(params[:order]).permit(:referral_channel_id, :client_email,:status,:message,:phone,:first_name,:last_name,:delivery_method,:lat,:lng,:address,:visa_method,:payment_method, :event_id, :promo_code_type_id)
      end

      def fatpayment_transaction_params
        ActionController::Parameters.new(params[:fatpayment_transaction]).permit(:transaction_id, :order_id, :payment_system, :total, :status, :pan6, :pan4, :external_order_id, :processing_error)
      end
    end

    resource :api do
      before do
        authenticate!
      end

      resource :klasses do
        
      end
    end
  end
end