class UsersController < ApplicationController
  get '/users/new' do
    erb :'users/new', :layout => :'users/new'
  end

  post '/users' do
    @user = User.new
    @user.username = params[:username]
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
      redirect '/session/new'
    else
      flash[:error] = "Your account could not be created. Please check your credentials and try again."
      redirect '/users/new'
    end
  end
  
  get '/session/new' do
    erb :'users/login', :layout => :'users/login'
  end

  post '/session' do
    login(params[:username], params[:password])
    redirect '/coffeelists'
  end

  get '/session' do
    logout
    redirect '/'
  end
end
