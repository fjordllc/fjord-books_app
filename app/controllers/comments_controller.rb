# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  # POST /comments or /comments.json
  def create
    @comment = @commentable.comments.new(comment_params.merge(user: current_user))

    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      render :new
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body, :user_id, :commentable_id, :commentable_type)
  end
end
