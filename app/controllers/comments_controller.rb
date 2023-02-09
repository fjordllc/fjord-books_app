# frozen_string_literal: true

class CommentsController < ApplicationController
  # before_action :set_user

  def create
    @comment = @comments.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @comments, notice: t('controllers.common.notice_create', name: Comment.human_attribute_name(:comment))
    else
      redirect_to @comments, notice: t('controllers.common.content_nil', name: Comment.human_attribute_name(:comment))
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
