class PostsController < ApplicationController

  def index
    @posts = Post.order(:created_at)
  end

  def new

  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to :action=>'show'
    else
      render :action=>'new'
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def post_params
    params.require(:post).permit(:title, :body)
  end

end