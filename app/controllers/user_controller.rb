class UserController < ApplicationController 

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