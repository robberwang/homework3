class PostsController < ApplicationController
  def index
    @posts = Post.all
  end 

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)

    if post.save!
      redirect_to posts_path
    else
      render :new
    end
  end

  private

  #確保 params 裡面的 post hash 存在，並且允許 title 和 content 被存取
  def post_params
    params.require(:post).permit(:title, :content)
  end
end