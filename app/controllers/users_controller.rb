class UsersController < ApplicationController
  def index
    # @users = User.all
  end

  def show
    # @user = User.find(params[:id])
  end

  def posts
    # @posts = Post.where(user_id: params[:id])
  end

  def post
    # @post = Post
    #   .where(user_id: params[:id])
    #   .where(id: params[:id])
    #   .first
  end
end