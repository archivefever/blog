 class CommentsController < ApplicationController

  before_filter :authorize

  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to url: {action: "show"}
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
      redirect_to '/posts/<%= @comment.post_id %>'
    else
      render :action=>'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize_comment_action(@comment)
    @comment.destroy
    redirect_to '/comments'
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :body)
  end

   def authorize_comment_action(comment)
    redirect to '/comments' unless current_user.id == comment.user_id
  end
end