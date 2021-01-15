# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable

  def create
    @comment = @commentable.comments.new(comment_params)
    # 投稿したUserのidを取得
    @comment.poster_id = current_user.id
    @comment.save
    redirect_to @commentable
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def set_commentable
    @commentable = Book.find(params[:book_id]) if params[:book_id]
    @commentable = Report.find(params[:report_id]) if params[:report_id]
  end

  def comment_params
    params.require(:comment).permit(:content, :poster_id)
  end
end
