class CoffeeListsController < ApplicationController

  get '/coffeelists' do
    if logged_in?
      @user = current_user
      @coffeelists = @user.coffee_lists.all
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

  post '/coffeelists' do
    if logged_in?
      if params[:list_name] == ''
        redirect '/coffeelists/new'
      else
        @coffeelist = current_user.coffee_lists.build(list_name: params[:list_name])
        if @coffeelist.save
          redirect to '/coffeelists'
        else
          redirect '/coffeelists/new'
        end
      end
    else
      redirect '/session/new'
    end
  end

  get '/coffeelists/:id' do
    if logged_in?
      @coffeelist = CoffeeList.find_by_id(params[:id])
      erb :'coffeelists/show_list'
    else
      redirect '/session/new'
    end
  end

  delete '/coffeelists/:id/delete' do
    if logged_in?
      @coffeelist = CoffeeList.find_by_id(params[:id])
      if @coffeelist && @coffeelist.user == current_user
        @coffeelist.delete
      end
      redirect to '/coffeelists'
    else
      redirect to '/session/new'
    end
  end
end
