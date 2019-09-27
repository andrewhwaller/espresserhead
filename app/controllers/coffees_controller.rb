#  Coffee Controller
class CoffeesController < ApplicationController

  before do
    redirect_if_not_logged_in
  end

  get '/coffees/new' do
    erb :'coffees/new'
  end

  # CREATE
  post '/coffees' do
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
        redirect to "/coffeelists/#{params[:coffee_list_id]}"
      else
        redirect '/coffees/new'
      end
    end
  end

  get '/coffees/:id/edit' do
    @coffee = Coffee.find_by_id(params[:id])
    if @coffee && @coffee.coffee_list.user == current_user
      erb :'coffees/edit'
    else
      redirect '/coffeelists'
    end
  end

  # UPDATE
  patch '/coffees/:id' do
    if params[:name] == ''
      redirect "/coffees/#{params[:id]}/edit"
    else
      @coffee = Coffee.find_by_id(params[:id])
      if @coffee && @coffee.coffee_list.user == current_user
        if @coffee.update(
          name: params[:name],
          coffee_list_id: params[:coffee_list_id],
          prep_method: params[:prep_method],
          rating: params[:rating],
          origin: params[:origin],
          roast: params[:roast],
          notes: params[:notes]
        )
          redirect "/coffeelists/#{@coffee.coffee_list_id}"
        else
          redirect "/coffees/#{params[:id]}/edit"
        end
      end
    end
  end

  # DESTROY
  delete '/coffees/:id/delete' do
    @coffee = Coffee.find_by_id(params[:id])
    if @coffee && @coffee.coffee_list.user == current_user
      @coffee.delete
    else
      redirect '/coffeelists'
    end
    redirect "/coffeelists/#{@coffee.coffee_list_id}"
  end
end
