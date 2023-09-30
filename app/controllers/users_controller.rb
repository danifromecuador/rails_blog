class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @two_more_recent_posts = @user.posts.order(created_at: :desc).limit(2)
  end
end
