class ApplicationController < Sinatra::Base 

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "espresserhead_test"
    end

    get '/' do 
        if !logged_in?
            redirect '/session/new'
        else
            erb :'users/index'
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