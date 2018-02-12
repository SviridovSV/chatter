class CommentsController < ApplicationController


  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to post_path(@comment.post)
    else
      redirect_to post_path(params[:post_id]), notice: 'Comment was not saved'
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :rate_value, :user_id)
  end
end