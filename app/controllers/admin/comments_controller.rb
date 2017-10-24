class Admin::CommentsController < AdminController

  def index
    @comments = Comment.all
  end

  def destroy
    @comment = Comment.find params[:id]
    if @comment.destroy
      redirect_to admin_comments_path, notice: 'Comment has been deleted!'
    else
      render 'index'
    end
  end

end
