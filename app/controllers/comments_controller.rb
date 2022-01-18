class CommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if book.comments.create(comment_params).valid?
        format.html { redirect_to book_path(params[:book_id]) }
      else
        format.html { redirect_to book_path(params[:book_id]), alert: 'コメントを登録できませんでした。'}
      end
    end
  end

  def edit
    @book = Book.find(params[:book_id])
    @comment = Comment.find(params[:id])
  end

  def update
    book = Book.find(params[:book_id])
    comment = Comment.find(params[:id])

    respond_to do |format|
      if comment.update(comment_params)
        format.html { redirect_to book_path(book) }
      else
        format.html { redirect_to book_path(book), alert: 'コメントを更新できませんでした。'}
      end
    end
  end

  def destroy
    book = Book.find(params[:book_id])
    comment = Comment.find(params[:id])
    comment.destroy
    respond_to do |format|
      format.html { redirect_to book_path(book), notice: t('controllers.common.notice_destroy', name: Comment.model_name.human) }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :commentable_type, :user_id)
  end

  def update_comment_params
    params.require(:comment).permit(:comment_content, :commentable_type, :user_id)
  end
end
