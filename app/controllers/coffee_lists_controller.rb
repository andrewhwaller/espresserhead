#  Coffeelists Controller
class CoffeeListsController < ApplicationController
  before_action :redirect_if_not_logged_in

  get '/coffeelists' do
    if current_user.coffee_lists.empty?
      erb :'coffeelists/empty'
    else
      erb :'coffeelists/show'
    end
  end

  get '/coffeelists/new' do
    if logged_in?
      erb :'coffeelists/new'
    else
      redirect '/session/new'
    end
  end

  # CREATE
  post '/coffeelists' do
    if params[:list_name] == ''
      redirect '/coffeelists/new'
    else
      @coffeelist = current_user.coffee_lists.build(list_name: params[:list_name], list_description: params[:list_description])
      if @coffeelist.save
        redirect to '/coffeelists'
      else
        redirect '/coffeelists/new'
      end
    end
  end

  # READ
  get '/coffeelists/:id' do
    @coffeelist = CoffeeList.find_by_id(params[:id])
    if @coffeelist.user_id == current_user.id
      erb :'coffeelists/show_list'
    else
      redirect '/coffeelists'
    end
  end

  get '/coffeelists/:id/edit' do
    @coffeelist = CoffeeList.find_by_id(params[:id])
    if @coffeelist && @coffeelist.user == current_user
      erb :'coffeelists/edit'
    else
      redirect '/coffeelists'
    end
  end

  # UPDATE
  patch '/coffeelists/:id' do
    if params[:name] == ''
      redirect "/coffeelists/#{params[:id]}/edit"
    else
      @coffeelist = CoffeeList.find_by_id(params[:id])
      if @coffeelist && @coffeelist.user == current_user
        if @coffeelist.update(
          list_name: params[:list_name],
          list_description: params[:list_description]
        )
          redirect '/coffeelists'
        else
          redirect "/coffeelists/#{params[:id]}/edit"
        end
      end
    end
  end

  # DESTROY
  delete '/coffeelists/:id/delete' do
    @coffeelist = CoffeeList.find_by_id(params[:id])
    if @coffeelist && @coffeelist.user == current_user
      @coffeelist.delete
    end
    redirect to '/coffeelists'
  end
end
