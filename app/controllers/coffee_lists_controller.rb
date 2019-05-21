#  Coffeelists Controller
class CoffeeListsController < ApplicationController
  get '/coffeelists' do
    if logged_in?
      @user = current_user
      @coffeelists = @user.coffee_lists.all
      if @coffeelists.empty?
        erb :'coffeelists/empty'
      else 
        erb :'coffeelists/show'
      end
    else
      login
    end
  end

  get '/coffeelists/new' do
    if logged_in?
      erb :'coffeelists/new'
    else
      redirect '/session/new'
    end
  end

  post '/coffeelists' do
    if logged_in?
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
    else
      redirect '/session/new'
    end
  end

  get '/coffeelists/:id' do
    @coffeelist = CoffeeList.find_by_id(params[:id])
    if logged_in? && @coffeelist.user_id == current_user.id
      erb :'coffeelists/show_list'
    elsif logged_in?
      redirect '/coffeelists'
    else
      redirect '/session/new'
    end
  end

  get '/coffeelists/:id/edit' do
    if logged_in?
      @coffeelist = CoffeeList.find_by_id(params[:id])
      erb :'coffeelists/edit'
    end
  end

  patch '/coffeelists/:id' do
    if logged_in?
      if params[:name] == ''
        redirect "/coffeelists/#{params[:id]}/edit"
      else
        @coffeelist = CoffeeList.find_by_id(params[:id])
        if @coffeelist && @coffeelist.user == current_user
          if @coffeelist.update(
            list_name: params[:list_name],
            list_description: params[:list_description]
            )
            redirect "/coffeelists/#{params[:id]}"
          else
            redirect "/coffeelists/#{params[:id]}/edit"
          end
        end
      end
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
