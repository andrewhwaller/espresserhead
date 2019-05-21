# Application Controller
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'test_secret'
  end

  get '/' do
    if !logged_in?
      redirect '/session/new'
    else
      @user = current_user
      @coffeelists = @user.coffee_lists.all
      erb :'coffeelists/show'
    end
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(:username => session[:username]) if session[:username]
    end

    def login(username, password)
      user = User.find_by(:username => username)
      if user && user.authenticate(password)
        session[:username] = user.username
      else
        redirect '/session/new'
      end
    end

    def logout
      session.destroy
    end
  end
end
