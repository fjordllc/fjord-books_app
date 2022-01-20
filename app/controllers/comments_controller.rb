class CommentsController < ApplicationController
  include CommonModule

  def create
    respond_to do |format|
      if collect_model_param[:set_type].comments.create(comment_params).valid?
        format.html { redirect_to collect_model_param[:path] }
      else
        format.html { redirect_to collect_model_param[:path], alert: 'コメントを登録できませんでした。'}
      end
    end
  end

  def edit
    @model = collect_model_param[:set_type]
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])

    respond_to do |format|
      if comment.update(comment_params)
        format.html { redirect_to collect_model_param[:path] }
      else
        format.html { redirect_to collect_model_param[:path], alert: 'コメントを更新できませんでした。'}
      end
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to collect_model_param[:path], notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :commentable_type, :user_id)
  end
end
