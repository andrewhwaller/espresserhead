#  Coffee Controller
class CoffeesController < ApplicationController
  get '/coffees' do
    if logged_in?
      @user = current_user
      @coffees = @user.coffee_lists.coffees.all
      erb :'coffees/show'
    else
      redirect '/session/new'
    end
  end

  get '/coffees/new' do
    if logged_in?
      erb :'coffeelists/new'
    else
      redirect '/session/new'
    end
  end

  post '/coffees' do
    if logged_in?
      if params[:name] == ''
        redirect '/coffees/new'
      else
        @coffee = current_user.coffee_lists.coffees.build(list_name: params[:list_name])
        if @coffee.save
          redirect to '/coffees'
        else
          redirect '/coffees/new'
        end
      end
    else
      redirect '/session/new'
    end
  end
end
