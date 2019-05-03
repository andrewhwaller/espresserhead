class UserController < ApplicationController 

    get '/login' do 
        erb :'users/login'
    end

    post '/login' do
        session[:username] = params[:username]
        "You are now logged in."
        redirect '/index'
    end

    get '/logout' do
        session.destroy
        redirect '/'
    end

    get '/index' do
        if logged_in?
            erb :'/users/index'
        else
            redirect '/login'
        end
    end
end