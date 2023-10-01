class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    
    @like = Like.new(user: @user, post: @post)
    
    if @like.save
      @post.increment!(:likes_counter)
      redirect_to user_post_path(@user, @post), notice: 'Liked successfully.'
    else
      redirect_to user_post_path(@user, @post), alert: 'Failed to like.'
    end
  end
end