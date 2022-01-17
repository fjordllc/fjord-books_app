class CommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if book.comments.create(comment_params)
        format.html { redirect_to book_path(params[:book_id]) }
      else
        p book.errors
        format.html { redirect_to book_path(params[:book_id]),  alert: 'コメントを登録できませんでした。'}
      end
    end
  end

  private

  def comment_params
    #params.require(:book).permit(:title, :memo, :author, :picture)
    params.require(:comment).permit(:comment_content, :commentable_type, :user_id)
  end
end
