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
    end

end