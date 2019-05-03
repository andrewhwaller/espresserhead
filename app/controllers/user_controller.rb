class UserController < ApplicationController 

    get '/signup' do
        erb :'users/new'
    end
    
    post '/signup' do
        @user = User.new
        @user.username = params[:username]
        @user.email = params[:email]
        @user.password = params[:password]
        if @user.save
            redirect '/login'
        else
            erb :'users/new'
        end
    end

    get '/login' do 
        erb :'users/login'
    end

    post '/login' do
        login(params[:username], params[:password])
        "You are now logged in."
        redirect '/index'
    end

    get '/logout' do
        logout
        redirect '/'
    end

    get '/index' do
        if logged_in?
            erb :'/users/index'
        else
            redirect '/login'
        end
    end

    get '/firewalkwithme' do
        if logged_in?
            erb :'/electricity'
        else    
            redirect '/login'
        end
    end
end