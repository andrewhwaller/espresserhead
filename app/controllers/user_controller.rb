class UserController < ApplicationController 

    get '/login' do 
        erb :'users/login'
    end

    post '/login' do
        "You are now logged in."
    end
end