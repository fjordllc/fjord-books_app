class CommentsController < ApplicationController
  def create
    # comment = current_user.comments.build(comment_params)
    @commentable = Report.find(params[:report_id])  
    @comment = @commentable.comments.build(comment_params)  

    if @comment.save
      flash[:notice] = 'コメントを投稿しました'
      redirect_to @commentable
    else
      redirect_to :back, flash: {
        comment: @comment,
        error_messages: @comment.errors.full_messages
      }
    end
  end
end

def comment_params
  params.require(:comment).permit(:commentable_type,:commentable_id,:body,:user_id)
end
