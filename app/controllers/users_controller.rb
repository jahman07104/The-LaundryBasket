class UsersController < ApplicationController

  get '/users' do
    @users = User.all
    erb :'/users/index'
  end

  get '/Users/new' do
    @items = Item.all
    erb :'/users/new'
  end

  post '/users' do
    @user = User.create(params[:owner])
    if !params["item"]["name"].empty?
      @user.pets << Item.create(name: params["item"]["name"])
    end
    @user.save
    redirect to "users/#{@user.id}"
  end

  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :'/users/edit'
  end

  get '/users/:id' do
    @user = Useer.find(params[:id])
    erb :'/users/show'
  end

  post '/users/:id' do
    @useer = User.find(params[:id])
    @user.update(params["owner"])
    if !params["item"]["name"].empty?
      @user.items << Item.create(name: params["item"]["name"])
    end
    redirect to "users/#{@User.id}"
  end
end