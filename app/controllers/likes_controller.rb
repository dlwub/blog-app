class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(post_id: params[:id], author: current_user)
    if @like.save
      redirect_to :back
    else
      render :new, status: :unprocessable_entity
    end
  end
end
