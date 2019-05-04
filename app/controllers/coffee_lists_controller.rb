class CoffeeListsController < ApplicationController

  get '/coffeelists' do
    if logged_in?
      @user = current_user
      @coffeelists = @user.coffeelist.all
      erb :'coffeelists/show'
    else
      login
    end
  end

  get '/coffeelists/new' do
    if logged_in?
      erb :'coffeelists/new'
    else
      login
    end
  end
  
end
