require 'bundler/setup'
require 'sinatra'
require 'sinatra/activerecord'
require 'bcrypt'
require 'sinatra/flash'
require "slim"
require 'pry'
require './config/warden'

class SinatraAPI < Sinatra::Base

  configure do
    set :session_secret, "supersecret"
    set :environment, :development

    set :auth do |bool|
      condition do
        redirect '/login' unless logged_in?
      end
    end
  end

  require './environments'

  Dir["./models/*.rb"].each {|file| require file }

  helpers do
    def protected!
      return if authorized?
      headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
      halt 401, "Not authorized\n"
    end

    def authorized?
      @auth ||=  Rack::Auth::Basic::Request.new(request.env)
      @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == [ HTTP_BASIC_AUTH['token'] ]
    end
  end

  before '/*' do
    # authenticated = authenticate_with_http_token do |user_token, options|
    #   user_email = options[:user_email].presence
    #   user       = user_email && User.find_by_email(user_email)

    #   if user && Devise.secure_compare(user.authentication_token, user_token)
    #     sign_in user, store: false
    #   else
    #     render json: 'Invalid authorization.'
    #   end
    # end

    # if !authenticated
    #   render json: 'No authorization provided.'
    # end
  end

  get '/' do
    slim :index
  end

  get '/api/v1/themes' do
    protected!
    content_type :json
    {themes: Theme.all}.to_json
  end


  post '/api/v1/users/sign_in' do
    # TODO: need to autorize user
    env['warden'].authenticate!
  end


  # warden authentication possible unnecessary
  # get '/auth/login' do
  #   slim :login
  # end

  # post '/auth/login' do
  #   env['warden'].authenticate!

  #   flash[:success] = env['warden'].message

  #   if session[:return_to].nil?
  #     redirect '/'
  #   else
  #     redirect session[:return_to]
  #   end
  # end

  # get '/auth/logout' do
  #   env['warden'].raw_session.inspect
  #   env['warden'].logout
  #   flash[:success] = 'Successfully logged out'
  #   redirect '/'
  # end

  # post '/auth/unauthenticated' do
  #   session[:return_to] = env['warden.options'][:attempted_path]
  #   puts env['warden.options'][:attempted_path]
  #   flash[:error] = env['warden'].message || "You must log in"
  #   redirect '/auth/login'
  # end
end