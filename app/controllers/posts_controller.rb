class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.all
  end

  def show
    @user = User.find(params[:user_id])
    puts @user
    @posts = @user.posts.all
    @post = @user.posts.find(params[:id])
  end
end
