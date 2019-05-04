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
end
