require 'bundler/setup'
require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require 'bcrypt'
require 'sinatra/flash'
require "slim"

Dir["./models/*.rb"].each {|file| require file }

configure do
  set :session_secret, "supersecret"

  set :auth do |bool|
    condition do
      redirect '/login' unless logged_in?
    end
  end
end

helpers do
  def logged_in?
    !@user.nil?
  end
end

get '*' do
  slim :index
end

get '/api/v1/themes' do
  content_type :json
  {themes: Theme.all}.to_json
end


post '/api/v1/users/sign_in' do
  # TODO: how to authenticate this params
  # params gets from js authenticator
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

# # available after log in
# get '/protected' do
#   env['warden'].authenticate!
#   @current_user = env['warden'].user
#   slim :protected
# end