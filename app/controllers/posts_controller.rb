class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments, :author)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
  end

  def author_name
    User.find_by(id: author_id)&.name
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new
  end

  def like
    @post = Post.find(params[:id])
    current_user.like(@post)

    redirect_to @post
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)

    if @post.save
      redirect_to user_posts_path(@user, @post)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
