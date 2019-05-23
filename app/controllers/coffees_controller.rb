#  Coffee Controller
class CoffeesController < ApplicationController
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
          redirect to "/coffeelists/#{params[:coffee_list_id]}"
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

  patch '/coffees/:id' do
    if logged_in?
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
    else
      redirect '/session/new'
    end
  end

  delete '/coffees/:id/delete' do
    if logged_in?
      @coffee = Coffee.find_by_id(params[:id])
      if @coffee && @coffee.coffee_list.user == current_user
        @coffee.delete
      end
      redirect "/coffeelists/#{@coffee.coffee_list_id}"
    else
      redirect to '/session/new'
    end
  end
end
