class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to @commentable, notice: 'コメントが正常に投稿されました'
    else
      render :new # コメントが正常に保存されないときってどんなとき？
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  end
