class SessionsController < Devise::SessionsController
  respond_to :html, :json

  def create
    super
  end
end