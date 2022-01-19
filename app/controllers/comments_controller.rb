class CommentsController < ApplicationController
  def create
    path = {commentable_type: params[:comment][:commentable_type], id: set_id}

    respond_to do |format|
      if set_data(comment_params).comments.create(comment_params).valid?
        format.html { redirect_to set_path(path) }
      else
        format.html { redirect_to set_path(path), alert: 'コメントを登録できませんでした。'}
      end
    end
  end

  def edit
    @model = set_data(params)
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    path = {commentable_type: params[:comment][:commentable_type], id: set_id}

    p '@@@@@@@@@@@@'
    p set_id
    p '@@@@@@@@@@@@'
    respond_to do |format|
      if comment.update(comment_params)
        format.html { redirect_to set_path(path) }
      else
        format.html { redirect_to set_path(path), alert: 'コメントを更新できませんでした。'}
      end
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    path = {commentable_type: params[:commentable_type], id: set_data(params)[:id]}

    respond_to do |format|
      format.html { redirect_to set_path(path), notice: t('controllers.common.notice_destroy', name: Comment.model_name.human) }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :commentable_type, :user_id)
  end

  def set_data(param)
    if param[:commentable_type] == 'Book'
      Book.find(params[:book_id])
    elsif param[:commentable_type] == 'Report'
      Report.find(params[:report_id])
    end
  end

  def set_path(data)
    if data[:commentable_type] == 'Book'
      book_path(data)
    elsif data[:commentable_type] == 'Report'
      report_path(data)
    end
  end

  def set_id
    if comment_params[:commentable_type] == 'Book'
      params[:book_id]
    elsif comment_params[:commentable_type] == 'Report'
      params[:report_id]
    end
  end
end
