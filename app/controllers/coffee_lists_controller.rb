class CoffeeListsController < ApplicationController

  get '/coffeelists' do
    if logged_in?
      # @user = current_user
      # @coffeelists = @user.coffee_list.all
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
      login
    end
  end
end
