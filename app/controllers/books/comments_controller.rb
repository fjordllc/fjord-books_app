# frozen_string_literal: true

class Books::CommentsController < ApplicationController
  before_action :set_book
  def create
    comment = @book.comments.new(comment_params)
    comment.user_id = current_user.id
    if comment.save
      redirect_to @book, notice: t('comments.success')
    else
      redirect_to @book, notice: t('comments.failure')
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
end
