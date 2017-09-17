class PostsController < ApplicationController

  def index
    @posts = Post.order(:created_at)
  end

  def show
    @post = Post.find(params[:id])
  end

  before_filter :authorize

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to url: {action: "show"}
    else
      render :action=>'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    authorize_post_action(@post)
  end

  def update
    @post = Post.find(params[:id])
    authorize_post_action(@post)
    @post.update_attributes(post_params)
    if @post.save
      redirect_to url: {action: "show"}
    else
      render :action=>'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize_post_action(@post)
    @post.destroy
    redirect_to '/posts'
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

   def authorize_post_action(post)
    redirect to '/posts' unless current_user.id == post.user_id
  end
end