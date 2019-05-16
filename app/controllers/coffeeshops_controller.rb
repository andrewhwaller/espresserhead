#  Coffeeshop Controller
class CoffeeshopsController < ApplicationController
  get '/coffeeshops/new' do
    if logged_in?
      erb :'coffeeshops/new'
    else
      redirect '/session/new'
    end
  end

  post '/coffeeshops' do
    if logged_in?
      if params[:name] == ''
        redirect '/coffeeshops/new'
      else
        @new_coffeeshop = Coffeeshop.new(
          name: params[:name],
          coffeeshop_list_id: params[:coffeeshop_list_id],
          location: params[:location],
          rating: params[:rating],
          notes: params[:notes]
        )
        if @new_coffeeshop.save
          redirect to '/coffeeshop_lists'
        else
          redirect '/coffeeshops/new'
        end
      end
    else
      redirect '/session/new'
    end
  end

  get '/coffeeshops/:id/edit' do
    if logged_in?
      @coffeeshop = Coffeeshop.find_by_id(params[:id])
      erb :'coffeeshops/edit'
    end
  end

  patch '/coffeeshops/:id' do
    if logged_in?
      if params[:name] == ''
        redirect "/coffeeshops/#{params[:id]}/edit"
      else
        @coffeeshop = Coffeeshop.find_by_id(params[:id])
        if @coffeeshop && @coffeeshop.coffeeshop_list.user == current_user
          if @coffeeshop.update(
            name: params[:name],
            coffeeshop_list_id: params[:coffeeshop_list_id],
            location: params[:location],
            rating: params[:rating],
            notes: params[:notes]
            )
            redirect "/coffeeshop_lists/#{@coffeeshop.coffeeshop_list_id}"
          else
            redirect "/coffeesshops/#{params[:id]}/edit"
          end
        end
      end
    else
      redirect '/session/new'
    end
  end

  delete '/coffeeshops/:id/delete' do
    if logged_in?
      @coffeeshop = Coffeeshop.find_by_id(params[:id])
      if @coffeeshop && @coffeeshop.coffeeshop_list.user == current_user
        @coffeeshop.delete
      end
      redirect "/coffeeshop_lists/#{@coffeeshop.coffeeshop_list_id}"
    else
      redirect to '/session/new'
    end
  end
end
