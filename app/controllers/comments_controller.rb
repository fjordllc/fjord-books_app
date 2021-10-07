# frozen_string_literal: true

class CommentsController < ApplicationController
  # new create edit update

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to books_path, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: t('controllers.common.notice_update', name: Comment.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_path, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def comment_params
    params.require(:comment).permit %i[id body user_id commentable_type commentable_id]
  end
end
