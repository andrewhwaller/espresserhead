class ApplicationController < Sinatra::Base 

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "espresserhead_test"
    end

    get '/' do 
        if !logged_in?
            redirect '/login'
        else
            erb :'users/index'
        end
    end

    helpers do
        def logged_in?
            !!session[:username]
        end

        def login(username, password)
            if user = User.find_by(:username => username)
                if user.authenticate(password)
                session[:username] = user.username
                end
            else
                redirect '/login'
            end
        end

        def logout
            session.destroy
        end
    end

end