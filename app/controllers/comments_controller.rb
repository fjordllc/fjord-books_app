class CommentsController < ApplicationController
  before_action :set_commentable, only: %i[create]  
  def create
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

def set_commentable
  resource, id = request.path.split('/')[1,2]
  @commentable = resource.singularize.classify.constantize.find(id)
end
