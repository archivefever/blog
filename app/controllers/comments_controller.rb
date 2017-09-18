 class CommentsController < ApplicationController

  before_filter :authorize

  def new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      render :action=>'new'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    authorize_comment_action(@comment)
  end

  def update
    @comment = Comment.find(params[:id])
    authorize_comment_action(@comment)
    @comment.update_attributes(comment_params)
    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      render :action=>'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize_comment_action(@comment)
    @comment.destroy
    redirect_to '/posts'
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :body, :post_id)
  end

   def authorize_comment_action(comment)
    redirect to '/posts' unless current_user.id == comment.user_id
  end
end