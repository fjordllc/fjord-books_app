class CommentsController < ApplicationController
  include CommonModule

  def create
    commentable_type = request.path.split('/')[1].singularize.capitalize

    respond_to do |format|
      if set_data(commentable_type).comments.create(comment_params).valid?
        format.html { redirect_to set_path(commentable_type) }
      else
        format.html { redirect_to set_path(commentable_type), alert: 'コメントを登録できませんでした。'}
      end
    end
  end

  def edit
    commentable_type = request.path.split('/')[1].singularize.capitalize
    @model = set_data(commentable_type)
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    commentable_type = request.path.split('/')[1].singularize.capitalize

    respond_to do |format|
      if comment.update(comment_params)
        format.html { redirect_to set_path(commentable_type) }
      else
        format.html { redirect_to set_path(commentable_type), alert: 'コメントを更新できませんでした。'}
      end
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    commentable_type = request.path.split('/')[1].singularize.capitalize
    redirect_to set_path(commentable_type), notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :commentable_type, :user_id)
  end

  def set_data(type)
    if type == 'Book'
      Book.find(params[:book_id])
    elsif type == 'Report'
      Report.find(params[:report_id])
    end
  end

  def set_path(commentable_type)
    path_data = {commentable_type: commentable_type, id: set_book_or_report_id(commentable_type)}
    if commentable_type == 'Book'
      book_path(path_data)
    elsif commentable_type == 'Report'
      report_path(path_data)
    end
  end
end
