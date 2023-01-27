class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(user_id: @user.id)
  end

  def show
    @user = User.find(params[:user_id])
    @posts = Post.where(user_id: @user.id)
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: params[:id])
  end
end
