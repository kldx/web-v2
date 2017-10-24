class CommentsController < ApplicationController

  def index
  end

  def create
    @commentable = Article.friendly.find params[:article_id]
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.js { redirect_to @commentable, notice: "Your comment was successfully posted." }
      else
        format.js { redirect_to @commentable, alert: "Something went wrong!" }
      end
    end
  end

  def destroy
    @commentable = Article.friendly.find params[:article_id]
    @comment = @commentable.comments.find params[:id]
    @comment.destroy
    redirect_to @commentable, notice: "Comment has been deleted."
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
