class ApplicationController < Sinatra::Base 

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "espresserhead_test"
    end

    get '/' do 
        if session[:username].nil?
            redirect '/login'
        else
            erb :'users/index'
        end
    end

end