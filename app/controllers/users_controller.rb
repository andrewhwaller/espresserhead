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
      flash[:error] = "An account with this username or email already exists! Please try again."
      redirect '/users/new'
    end
  end
  
  get '/session/new' do
    erb :'users/login', :layout => :'users/login'
  end

  post '/session' do
    if login(params[:username], params[:password])
      redirect '/coffeelists'
    else
      flash[:login] = "Login failed! Please check credentials and try again."
      redirect '/session/new'
    end
  end

  get '/session' do
    logout
    redirect '/'
  end
end
