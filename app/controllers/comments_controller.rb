# frozen_string_literal: true

class CommentsController < ApplicationController
  # before_action :set_user

  def create
    @comment = @comments.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @comments, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      # コメント作成失敗時の処理は後述
    end
  end

  def show
    @comment = Comment.new
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
