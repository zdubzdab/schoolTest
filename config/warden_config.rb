require "warden"
require 'pry'

Warden::Strategies.add(:password) do
  def valid?
    params['user']['first_name'] && params['user']['last_name'] && params['user']['password']
  end

  def authenticate!
    # try to do this without additional token logic
    # authenticate_with_token! if params[:token]
    user = User.first(first_name: params['user']['first_name'], last_name: params['user']['last_name'])

    if user.nil?
      throw(:warden, message: "The username you entered does not exist.")
    elsif user.authenticate(params['user']['password'])
      # user.generate_auth_token
      success!(user)
    else
      throw(:warden, message: "The username and password combination ")
    end
  end

  def authenticate_with_token!
    user = User.find_by_auth_token(params[:token])

    if user.nil?
      throw(:warden, message: "The username you entered does not exist.")
    elsif user.authenticate(params['user']['password'])
      user.generate_auth_token
      success!(user)
    else
      throw(:warden, message: "The username and password combination ")
    end
  end
end

Warden::Manager.before_failure do |env,opts|
  env['REQUEST_METHOD'] = 'POST'
end

use Warden::Manager do |config|
  # Tell Warden how to save our User info into a session.
  # Sessions can only take strings, not Ruby code, we'll store
  # the User's `id`
  config.serialize_into_session{|user| user.id }
  # Now tell Warden how to take what we've stored in the session
  # and get a User from that information.
  config.serialize_from_session{|id| User.get(id) }

  config.scope_defaults :default,
    # "strategies" is an array of named methods with which to
    # attempt authentication. We have to define this later.
    strategies: [:password],
    # The action is a route to send the user to when
    # warden.authenticate! returns a false answer. We'll show
    # this route below.
    action: 'auth/unauthenticated'
  # When a user tries to log in and cannot, this specifies the
  # app to send the user to.
  config.failure_app = self
end