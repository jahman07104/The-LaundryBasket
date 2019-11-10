class ItemsController < ApplicationController

  get '/items' do
    @items = Item.all
    erb :'/items/index'
  end

  get '/items/new' do
    @users = User.all
    erb :'/items/new'
  end

  post '/items' do
    @item = Item.create(params["item"])
    if !params["user"]["name"].empty?
      @item.user = User.create(name: params["user"]["name"])
      binding.pry
    end
    @item.save
    redirect to "items/#{@item.id}"
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    erb :'/items/show'
  end

  get '/items/:id/edit' do
    @item= Item.find(params[:id])
    erb :'/items/edit'
  end

  post '/items/:id' do
    @item = Item.find(params[:id])
    @item.update(params["basket"])
    if !params["user"]["name"].empty?
      @item.user = User.create(name: params["user"]["name"])
    end
    @item.save
    redirect to "items/#{@item.id}"
  end
end
