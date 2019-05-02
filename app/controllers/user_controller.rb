class UserController < ApplicationController 

    get '/login' do 
        erb :'users/login'
    end

    post '/login' do
        session[:username] = params[:username]
        "You are now logged in."
        erb :'/users/index'
    end

    get '/logout' do
        session.destroy
        redirect '/'
    end
end