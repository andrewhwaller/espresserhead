#  Coffee Controller
class CoffeesController < ApplicationController
  get '/coffees' do
    if logged_in?
      # @user = current_user
      # @coffees = @user.coffee_lists.coffees.all
      erb :'coffees/show'
    else
      redirect '/session/new'
    end
  end

  get '/coffees/new' do
    if logged_in?
      erb :'coffees/new'
    else
      redirect '/session/new'
    end
  end

  post '/coffees' do
    if logged_in?
      if params[:name] == ''
        redirect '/coffees/new'
      else
        @new_coffee = Coffee.new(
          name: params[:name],
          coffee_list_id: params[:coffee_list_id],
          prep_method: params[:prep_method],
          rating: params[:rating],
          origin: params[:origin],
          roast: params[:roast],
          notes: params[:notes]
        )
        if @new_coffee.save
          redirect to '/coffeelists'
        else
          redirect '/coffees/new'
        end
      end
    else
      redirect '/session/new'
    end
  end

  get '/coffees/:id/edit' do
    if logged_in?
      @coffee = Coffee.find_by_id(params[:id])
      erb :'coffees/edit'
    end
  end
end
