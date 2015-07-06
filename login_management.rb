module LoginManagement
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

  post '/api/v1/users/sign_in' do
    # TODO: need to autorize user
    env['warden'].authenticate!
  end

  # some snipet
  # get "/" do
  #   haml :welcome
  # end

  # post '/unauthenticated/?' do
  #   status 401
  #   haml :login
  # end

  # get '/login/?' do
  #   haml :login
  # end

  # post '/login/?' do
  #   env['warden'].authenticate!
  #   redirect "/"
  # end

  # get '/logout/?' do
  #   env['warden'].logout
  #   redirect '/'
  # end



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

register LoginManagement