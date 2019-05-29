# Application Controller
require 'sinatra/flash'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    register Sinatra::Flash
    set :session_secret, 'test_secret'
  end

  get '/' do
    redirect_if_not_logged_in
    @user = current_user
    @coffeelists = @user.coffee_lists.all
    erb :'coffeelists/show'
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect '/session/new'
      end
    end

    def current_user
      @current_user ||= User.find_by(:username => session[:username]) if session[:username]
    end

    def flash_types
      [:success, :notice, :warning, :error]
    end

    def login(username, password)
      user = User.find_by(:username => username)
      if user && user.authenticate(password)
        session[:username] = user.username
      end
    end

    def logout
      session.destroy
    end
  end
end
