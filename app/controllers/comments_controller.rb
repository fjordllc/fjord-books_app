# frozen_string_literal: true

class CommentsController < ApplicationController
  include CommonModule

  def create
    respond_to do |format|
      if collect_model_param[:set_type].comments.create(comment_params).valid?
        format.html { redirect_to collect_model_param[:path], notice: t('controllers.common.notice_create', name: Comment.model_name.human) }
      else
        format.html { redirect_to collect_model_param[:path], alert: 'コメントを登録できませんでした。' }
      end
    end
  end

  def edit
    @model = collect_model_param[:set_type]
    @comment = set_comment
  end

  def update
    respond_to do |format|
      if set_comment.update(comment_params)
        format.html { redirect_to collect_model_param[:path], notice: t('controllers.common.notice_update', name: Comment.model_name.human) }
      else
        format.html { redirect_to collect_model_param[:path], alert: 'コメントを更新できませんでした。' }
      end
    end
  end

  def destroy
    set_comment.destroy
    redirect_to collect_model_param[:path], notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def set_comment
    Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment_content, :commentable_type, :user_id)
  end
end
